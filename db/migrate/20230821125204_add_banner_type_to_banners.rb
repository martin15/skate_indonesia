class AddBannerTypeToBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :banners, :banner_type , :string, limit: 255
  end
end
