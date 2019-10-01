class Admin::PlacesController < Admin::ApplicationController
  before_action :find_page, :only => [:edit, :update, :destroy, :delete]

  def index
    @places = Place.all.page(params[:page]).per(20)
    @no = paging(20)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(page_params)

    if @place.save
      flash[:notice] = 'Place was successfully create.'
      redirect_to admin_places_path
    else
      flash[:error] = "Place failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @place.update_attributes(page_params)
      flash[:notice] = 'Place was successfully updated.'
      redirect_to admin_places_path
    else
      flash[:error] = "Place failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @place.destroy ? 'Place was successfully deleted.' :
                                        'Place was falied to delete.'
    redirect_to admin_places_path
  end

  private

    def page_params
      params.require(:place).permit(:name, :address, :description, :url, :image, :permalink)
    end

    def find_page
      @place = Place.find_by_id(params[:id])
      if @place.nil?
        flash[:notice] = "Cannot find the Place with id '#{params[:id]}'"
        redirect_to admin_places_path
      end
    end
end
