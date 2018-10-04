class PagesController < ApplicationController
  def home
    @flats = Flat.all
  end
end
