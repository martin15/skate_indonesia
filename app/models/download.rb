class Download < ApplicationRecord
  mount_uploader :file, DownloadUploader

end
