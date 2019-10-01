class InformationsController < ApplicationController
  def index
    @places = Place.all
  end
end
