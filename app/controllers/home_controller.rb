class HomeController < ApplicationController
  def index
    @greeting = Page.find_by_name("greeting-1")
    @home_note = Page.find_by_name("home-1")
    @banners = Banner.all
    countdown = Page.find_by_permalink("countdown")
    countdown_splited = countdown.content.gsub("<p>", "").gsub("</p>", "").strip.split("-")
    @date = countdown_splited[2]
    @month = countdown_splited[1]
    @year = countdown_splited[0]
  end

  def covid_19
  end
end
