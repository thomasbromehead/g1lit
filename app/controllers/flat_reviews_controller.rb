class FlatReviewsController < ApplicationController
  before_action :set_flat

  def create
<<<<<<< HEAD
    @review = FlatReview.new(review_params)
    @review.flat = @flat
    if @review.save
      raise
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to flat_path(@flat)
    end
=======


>>>>>>> parent of 18c245b... <fix> Fixed Reviews Route names to Flat_reviews :ambulance:
  end

  def index
    @reviews = FlatReview.find(params[:flat_id, :flat_review])
  end
  
  def update
  end

  def

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:flat_review).permit(:content, :star_rating)
  end
end
