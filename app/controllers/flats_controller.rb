class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
      if params[:city].present?
      lat = deconstruct(params[:city]).dig('lat')
      lng = deconstruct(params[:city]).dig('lng')
      @flats = Flat.search("*", page: params[:page], per_page: 6, boost_by_distance: { location: {origin: { lat: lat, lon: lng}}},  where: {
        location: 
          {
            near:
            {
              lat: lat,
              lon: lng
            }, 
            within: "20km"
          }
      })
      else
      @flats = Flat.all.paginate(page: params[:page], per_page:8).where.not(latitude: nil, longitude: nil).includes(:owner)
      end

    # @flats = Flat.paginate(page: params[:page], per_page:5)
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
  end

  def show
    @flat_pics = @flat.image_data.split(',')
    @user = current_user
    @marker = JSON.generate({
      lat: @flat.latitude,
      long: @flat.longitude,
      category: @flat.category
    })
    @review = FlatReview.new
    @flat = Flat.find(params[:id])
    @availables = Flat.where(booked: false)
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

