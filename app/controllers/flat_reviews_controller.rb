class FlatReviewsController < ApplicationController
  before_action :set_flat

  def new
  end

  def create
    FlatReview.build content:params[:id, :content], user_id: current_user.id

  end

  def index
    FlatReview.all
  end
  
  def edit
  end

  def update
  end

  def

    private

  def set_flat
    Flat.find(params[:id])
  end
end
