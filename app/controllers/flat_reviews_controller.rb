class FlatReviewsController < ApplicationController
  before_action :set_flat

  def new
    @review = FlatReview.new
  end

  def create
    @flat_review = FlatReview.build(review_params)
    if user.signed_in?
      flat_review.user_id = current_user.id
      flat_review.save
    else 
      flash[:notice] = "Désolé, vous ne pouvez pas laisser un avis sans être connecté(e)."
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

  def

  private

  def set_flat
    Flat.find(params[:id])
  end

  def review_params
    params.require(:flat_review).permit(:content, :star_rating)
  end
end
