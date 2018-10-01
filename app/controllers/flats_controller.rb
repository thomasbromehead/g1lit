class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
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
      redirect_to flat_path(@flat), notice: 'flat was successfully created.'
    else
      render :new
    end
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'flat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'flat was successfully destroyed.'
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :category, :description, :price_per_night,:photo, :nb_of_bathrooms, photos:[])
  end
end
