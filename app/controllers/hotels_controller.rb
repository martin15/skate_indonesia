class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all.includes([:hotel_images])
  end

end
