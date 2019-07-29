class Tenant < ApplicationRecord
  has_permalink :name, :update => true

  has_many :tenant_images, inverse_of: :tenant

  validates :name, presence: true

  accepts_nested_attributes_for :tenant_images, allow_destroy: true

  def image(size)
    img = self.tenant_images.first
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return img.image.url(size.to_sym)
    end
  end

  def galleries
    img = self.tenant_images.first
    return [] if img.nil?
    galleries = self.tenant_images.where("id != #{img.id}")
    return galleries
  end
end
