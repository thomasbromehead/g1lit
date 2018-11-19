class FlatReviewsController < ApplicationController
  before_action :set_flat

  def new
    @flat_review = FlatReview.new
  end

  def create
    @flat_review = FlatReview.new(review_params)
    @flat_review.flat = @flat
    if @flat_review.save
      flash[:notice] = "Votre avis a bien été publié 💌"
      redirect_to flat_path(@flat)
    else
      redirect_to flat_path(@flat)
    end
  end

  def index
    @reviews = FlatReview.find(params[:flat_id, :flat_review])
  end
  
  def update
  end


  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:flat_review).permit(:content)
  end

end
