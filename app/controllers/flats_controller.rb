class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def self.per_page
    5
  end

  def index
     @flats = Flat.paginate(page: params[:page], per_page:8).where.not(latitude: nil, longitude: nil)
    # @flats = Flat.paginate(page: params[:page], per_page:5)
    @markers = @flats.map do |flat|
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
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @user_id = current_user.id
    @flat = Flat.new(flat_params)
    @flat.user_id = @user_id
    
    if @flat.save
      redirect_to flat_path(@flat), notice: 'Votre logement a bien été crée, bravo! 👏'
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
end
