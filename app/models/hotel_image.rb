class HotelImage < ApplicationRecord
  belongs_to :hotel

  mount_uploader :image, HotelImageUploader

  validates :image, presence: true
end
