class FlatReviewsController < ApplicationController
  before_action :set_flat, except: [:destroy, :update]

  def new
    @flat_review = FlatReview.new
  end

  def create
    @flat_review = FlatReview.new(review_params)
    @flat_review.flat = @flat
    @flat_review.user_id = current_user.id
    if @flat_review.save
      #wont happen because form_with submits in AJAX
      flash.now[:notice] = "Votre avis a bien été publié 💌"
      respond_to do |format|
        format.html { redirect_to flat_path(@flat) }
        format.js 
      end
    else
      respond_to do |format|
        format.html { redirect_to flat_path(@flat) }
        format.js
      end
    end
  end

  def index
    @reviews = FlatReview.find(params[:flat_id, :flat_review])
  end
  
  def update
  end

  def destroy
    flat_review = FlatReview.find(params[:id])
    FlatReview.delete(flat_review)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:flat_review).permit(:content)
  end

end
