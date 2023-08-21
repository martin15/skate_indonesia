class HomeController < ApplicationController
  def index
    @greeting = Page.find_by_name("greeting-1")
    @home_note = Page.find_by_name("home-1")
    @banners = Banner.where("banner_type = 'Home' or banner_type = '' or banner_type is null")
    countdown = Page.find_by_permalink("countdown")
    countdown_splited = countdown.content.gsub("<p>", "").gsub("</p>", "").strip.split("-")
    @date = countdown_splited[2]
    @month = countdown_splited[1]
    @year = countdown_splited[0]
  end

  def sponsor_and_partnership
    @sponsors = Banner.where("banner_type = 'Sponsor'")
    @partnerships = Banner.where("banner_type = 'Partnership'")
  end
end
