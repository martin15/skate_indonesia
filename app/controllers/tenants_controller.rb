class TenantsController < ApplicationController
  def index
    @tenants = Tenant.includes([:tenant_images]).order("name")
    @mall_desc_header = Page.find_by_name("tenant-header")
    @mall_desc_footer = Page.find_by_name("tenant-footer")
  end
end
