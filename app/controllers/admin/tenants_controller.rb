class Admin::TenantsController < Admin::ApplicationController
  before_action :find_tenant, :only => [:edit, :update, :destroy, :delete]

  def index
    @tenants = Tenant.all.page(params[:tenant]).per(20)
    @no = paging(20)
  end

  def new
    @tenant = Tenant.new
    @tenant.tenant_images.build
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      flash[:notice] = 'Tenant was successfully create.'
      redirect_to admin_tenants_path
    else
      @tenant.tenant_images = []
      @tenant.tenant_images.build 
      flash[:error] = "Tenant failed to create"
      render :action => :new
    end
  end

  def edit
    if @tenant.tenant_images.blank?
      @tenant.tenant_images.build
    end
  end

  def update
    if @tenant.update_attributes(tenant_params)
      flash[:notice] = 'Tenant was successfully updated.'
      redirect_to admin_tenants_path
    else
      if @tenant.tenant_images.blank?
        @tenant.tenant_images.build
      end
      flash[:error] = "Tenant failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @tenant.destroy ? 'Tenant was successfully deleted.' :
                                        'Tenant was falied to delete.'
    redirect_to admin_tenants_path
  end

  private

    def tenant_params
      params.require(:tenant).permit(:name, :description, tenant_images_attributes: [:id, :image, :_destroy])
    end

    def find_tenant
      @tenant = Tenant.find_by_id(params[:id])
      if @tenant.nil?
        flash[:notice] = "Cannot find the Tenant with id '#{params[:id]}'"
        redirect_to admin_tenants_path
      end
    end
end
