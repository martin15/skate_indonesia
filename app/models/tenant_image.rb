class TenantImage < ApplicationRecord
  belongs_to :tenant

  mount_uploader :image, TenantImageUploader

  validates :image, presence: true
end
