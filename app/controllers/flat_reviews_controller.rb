class FlatReviewsController < ApplicationController
  before_action :set_flat

  def create


  end

  def index
    @reviews = FlatReview.find(params[:flat_id, :flat_review])
  end
  
  def edit
    FlatReview.find(@flat)
  end

  def update
  end

  def

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def review_params
    params.require(:flat_review).permit(:content, :star_rating)
  end
end
