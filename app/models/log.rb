class Log < ApplicationRecord
  belongs_to :user
  belongs_to :dive_site
  mount_uploader :image, ImageUploader



end
