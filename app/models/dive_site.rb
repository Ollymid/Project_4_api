class DiveSite < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id' 
  has_many :logs
  has_many :users, through: :logs
  mount_uploader :image, ImageUploader

  validates :name, length: { in: 4..150 }

end
