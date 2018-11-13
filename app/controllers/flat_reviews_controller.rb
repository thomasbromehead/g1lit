class FlatReviewsController < ApplicationController
  before_action :set_flat

  def create
    @review = FlatReview.new(review_params)
    @review.flat = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  def index
    @reviews = FlatReview.find(params[:flat_id, :flat_review])
  end
  
  def edit
    FlatReview.find(@flat)
  end

  def update
  end


  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def review_params
    params.require(:flat_review).permit(:content, :star_rating)
  end
end
