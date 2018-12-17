require "json"

class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :index

  def index
    if request.filtered_parameters["ne"] && request.filtered_parameters["sw"] && params[:city].nil?
      puts('--------')
      puts('AJAX SEARCH')
      puts('------')
      puts
      northeast = JSON.parse(params[:ne])
      southwest = JSON.parse(params[:sw])
      sw_lat = southwest["lat"]
      sw_lng = southwest["lng"]
      ne_lat = northeast["lat"]
      ne_lng = northeast["lng"]

      @flats = Flat.search "*", where: {location: {top_left: {lat: ne_lat, lon: ne_lng}, bottom_right: {lat: sw_lat, lon: sw_lng}}}
      puts("Northeast Longitude: #{ne_lng}, Southwest Longitude: #{sw_lng}")
      puts("Flats.length: #{@flats.length}")
      @markers = Flat.all.map do |flat|
        {
          lat: flat.latitude,
          long: flat.longitude,
          price_per_night: flat.price_per_night,
          id: flat.id,
          address: flat.street,
          postalCode: flat.zip_code,
          country: flat.country,
          city: flat.city,
          street: flat.street,
          category: flat.category
        }
      end
      respond_to do |format|
        puts 'entering the respond_to'
        format.js { }
      end

    elsif params[:city] != "" && !params[:city].nil? 
      puts('--------')
      puts('City provided')
      puts('------------')
      lat = deconstruct(params[:city]).dig('lat') unless request.filtered_parameters["ne"]
      lng = deconstruct(params[:city]).dig('lng' )unless request.filtered_parameters["ne"]
      @flats = Flat.search("*", page: params[:page], per_page: 6, where: {
        location: 
          {
            near:
            {
              lat: lat,
              lon: lng
            }
          }
      })
      @start = params['start-date'] if params["start-date"]
      @end = params["end-date"] if params["end-date"]
      @center = [lng, lat]
      @zoom = 10
      @markers = Flat.all.map do |flat|
        {
          lat: flat.latitude,
          long: flat.longitude,
          price_per_night: flat.price_per_night,
          id: flat.id,
          address: flat.street,
          postalCode: flat.zip_code,
          country: flat.country,
          city: flat.city,
          street: flat.street,
          category: flat.category
        }
      end
      raise
      respond_to do |format|
        format.html { render "flats/index"}
      end
      
    else
        @zoom = 5.5
        puts('--------')
        puts('no city provided')
        puts('--------')
        @flats = Flat.all.paginate(page: params[:page], per_page:8).where.not(latitude: nil, longitude: nil).includes(:owner)
        @center = [2.3488, 45.8534]
        @markers = Flat.all.map do |flat|
          {
            lat: flat.latitude,
            long: flat.longitude,
            price_per_night: flat.price_per_night,
            id: flat.id,
            address: flat.street,
            postalCode: flat.zip_code,
            country: flat.country,
            city: flat.city,
            street: flat.street,
            category: flat.category
          }
        end
        respond_to do |format|
          format.html { render "index"}
        end
     end
  end

  def show
    @flat_pics = @flat.image_data.split(',')
    @user = current_user
    @marker = JSON.generate({
      lat: @flat.latitude,
      long: @flat.longitude,
      category: @flat.category
    })
    @start = params["start_date"] if params["start_date"]
    @end = params["end_date"] if params["end_date"]
    @flat_review = FlatReview.new
    @flat = Flat.find(params[:id])
    @availables = Flat.where(booked: false)
    @reviews = @flat.flat_reviews
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @user = current_user.id
    @flat = Flat.new
    @flat = Flat.new(flat_params)
    @flat.user_id = @user_id 
    if @flat.save
      redirect_to flat_path(@flat), notice: 'Votre logement a été ajouté. Bravo! 👏'
    else
      render :new
    end
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Votre logement a bien été modifié. ✌🏼'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Votre logement a bien été supprimé 😞.'
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :category, :description, :price_per_night, :nb_of_bathrooms, :nb_rooms, photos: [])
  end

  def deconstruct(city)
    # Use this one if you want a box area
    # Geocoder.search(city).first.data.dig('geometry').first.flatten[1]
    # Use this for city's exact location
      Geocoder.search(city).first.data.dig('geometry','location')
  end
end

