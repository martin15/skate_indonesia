class Admin::HotelImagesController < Admin::ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_hotel, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_hotel_image, :only => [:edit, :update, :destroy]

  def new
    respond_to do |format|
      @hotel_image = HotelImage.new
      format.js
    end
  end

  def create
    @hotel_image = HotelImage.new(hotel_image_params)
    @hotel_image.hotel = @hotel
    if @hotel_image.save
      flash[:notice] = 'HotelImage was successfully create.'
    else
      flash[:error] = "HotelImage failed to create"
    end
    redirect_to edit_admin_hotel_path(@hotel.id)
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @failed_hotel_image = 0
    if @hotel_image.update_attributes(hotel_image_params)
      flash[:notice] = 'HotelImage was successfully updated.'
      redirect_to edit_admin_hotel_path(@hotel.id)
    else
      flash[:error] = "HotelImage failed to update"
      @failed_hotel_image = @hotel_image.id
      redirect_to edit_admin_hotel_path(@hotel.id, failed_hotel_image: @hotel_image.id)
    end
  end

  def destroy
    flash[:notice] =  @hotel_image.destroy ? 'HotelImage was successfully deleted.' :
                                                'HotelImage was falied to delete.'
    redirect_to edit_admin_hotel_path(@hotel.id)
  end

  private

    def hotel_image_params
      params[:hotel_image] = {image: ""} if params[:hotel_image].blank?
      params.require(:hotel_image).permit(:image)
    end

    def find_hotel_image
      @hotel_image = HotelImage.find_by_id(params[:hotel_image_id])
      if @hotel_image.nil?
        flash[:notice] = "Cannot find the HotelImage with id '#{params[:hotel_image_id]}'"
        redirect_to admin_hotels_path
      end
    end

    def find_hotel
      @hotel = Hotel.find_by_id(params[:id])
      if @hotel.nil?
        flash[:notice] = "Cannot find the Hotel with id '#{params[:id]}'"
        redirect_to admin_hotels_path
      end
    end
end
