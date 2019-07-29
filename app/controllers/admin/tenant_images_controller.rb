class Admin::TenantImagesController < Admin::ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_tenant, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_tenant_image, :only => [:edit, :update, :destroy]

  def new
    respond_to do |format|
      @tenant_image = TenantImage.new
      format.js
    end
  end

  def create
    @tenant_image = TenantImage.new(tenant_image_params)
    @tenant_image.tenant = @tenant
    if @tenant_image.save
      flash[:notice] = 'TenantImage was successfully create.'
    else
      flash[:error] = "TenantImage failed to create"
    end
    redirect_to edit_admin_tenant_path(@tenant.id)
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @failed_tenant_image = 0
    if @tenant_image.update_attributes(tenant_image_params)
      flash[:notice] = 'TenantImage was successfully updated.'
      redirect_to edit_admin_tenant_path(@tenant.id)
    else
      flash[:error] = "TenantImage failed to update"
      @failed_tenant_image = @tenant_image.id
      redirect_to edit_admin_tenant_path(@tenant.id, failed_tenant_image: @tenant_image.id)
    end
  end

  def destroy
    flash[:notice] =  @tenant_image.destroy ? 'TenantImage was successfully deleted.' :
                                                'TenantImage was falied to delete.'
    redirect_to edit_admin_tenant_path(@tenant.id)
  end

  private

    def tenant_image_params
      params[:tenant_image] = {image: ""} if params[:tenant_image].blank?
      params.require(:tenant_image).permit(:image)
    end

    def find_tenant_image
      @tenant_image = TenantImage.find_by_id(params[:tenant_image_id])
      if @tenant_image.nil?
        flash[:notice] = "Cannot find the TenantImage with id '#{params[:tenant_image_id]}'"
        redirect_to admin_tenants_path
      end
    end

    def find_tenant
      @tenant = Tenant.find_by_id(params[:id])
      if @tenant.nil?
        flash[:notice] = "Cannot find the Tenant with id '#{params[:id]}'"
        redirect_to admin_tenants_path
      end
    end
end
