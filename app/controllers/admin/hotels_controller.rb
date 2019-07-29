class Admin::HotelsController < Admin::ApplicationController
  before_action :find_hotel, :only => [:edit, :update, :destroy, :delete]

  def index
    @hotels = Hotel.all.page(params[:hotel]).per(20)
    @no = paging(20)
  end

  def new
    @hotel = Hotel.new
    @hotel.hotel_images.build
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = 'Hotel was successfully create.'
      redirect_to admin_hotels_path
    else
      @hotel.hotel_images = []
      @hotel.hotel_images.build 
      flash[:error] = "Hotel failed to create"
      render :action => :new
    end
  end

  def edit
    if @hotel.hotel_images.blank?
      @hotel.hotel_images.build
    end
  end

  def update
    if @hotel.update_attributes(hotel_params)
      flash[:notice] = 'Hotel was successfully updated.'
      redirect_to admin_hotels_path
    else
      if @hotel.hotel_images.blank?
        @hotel.hotel_images.build
      end
      flash[:error] = "Hotel failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @hotel.destroy ? 'Hotel was successfully deleted.' :
                                        'Hotel was falied to delete.'
    redirect_to admin_hotels_path
  end

  private

    def hotel_params
      params.require(:hotel).permit(:name, :address, :phone, :rating, :description,
                                    hotel_images_attributes: [:id, :image, :_destroy])
    end

    def find_hotel
      @hotel = Hotel.find_by_id(params[:id])
      if @hotel.nil?
        flash[:notice] = "Cannot find the Hotel with id '#{params[:id]}'"
        redirect_to admin_hotels_path
      end
    end
end
