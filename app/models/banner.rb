class Banner < ApplicationRecord
  TYPE = ["Home", "Sponsor", "Partnership" ]
  mount_uploader :image, BannerUploader

  validates_presence_of :image
end
