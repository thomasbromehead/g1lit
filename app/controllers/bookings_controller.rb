class BookingsController < ApplicationController
  

  def create
    @booking = Booking.new(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
