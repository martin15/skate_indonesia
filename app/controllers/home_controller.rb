class HomeController < ApplicationController
  def index
    @greeting = Page.find_by_name("greeting-1")
    @home_note = Page.find_by_name("home-1")
    @banners = Banner.all
  end
end
