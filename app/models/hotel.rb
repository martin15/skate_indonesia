class Hotel < ApplicationRecord
  RATING = [["1 star", 1], ["2 star", 2], ["3 star", 3], ["4 star", 4], ["5 star", 5]]

  has_permalink :name, :update => true

  has_many :hotel_images, inverse_of: :hotel

  validates :name, presence: true

  accepts_nested_attributes_for :hotel_images, allow_destroy: true

  def image(size)
    img = self.hotel_images.first
    if img.nil?
      return "/assets/no-image-yet.jpg"
    else
      return img.image.url(size.to_sym)
    end
  end
end
