class Admin::DownloadsController < Admin::ApplicationController
  before_action :find_download, :only => [:edit, :update, :destroy, :delete]

  def index
    @downloads = Download.all.page(params[:download]).per(20)
    @no = paging(20)
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(download_params)

    if @download.save
      flash[:notice] = 'Download was successfully create.'
      redirect_to admin_downloads_path
    else
      flash[:error] = "Download failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @download.update_attributes(download_params)
      flash[:notice] = 'Download was successfully updated.'
      redirect_to admin_downloads_path
    else
      flash[:error] = "Download failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @download.destroy ? 'Download was successfully deleted.' :
                                        'Download was falied to delete.'
    redirect_to admin_downloads_path
  end

  private

    def download_params
      params.require(:download).permit(:file, :title, :description)
    end

    def find_download
      @download = Download.find_by_id(params[:id])
      if @download.nil?
        flash[:notice] = "Cannot find the Download with id '#{params[:id]}'"
        redirect_to admin_downloads_path
      end
    end
end
