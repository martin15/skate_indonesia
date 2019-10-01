class Place < ApplicationRecord
  mount_uploader :image, PlaceUploader

  validates :name, presence: true

  def get_image(size = :large)
    self.try(:image).try(:url, size) || ""
  end
end
