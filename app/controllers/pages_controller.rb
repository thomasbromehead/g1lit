class PagesController < ApplicationController
  def home
    @last_six = Flat.order('created_at DESC').limit(6)
  end


end
