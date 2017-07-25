class DiveSite < ApplicationRecord
  has_many :logs
  has_many :users, through: :logs

  
  validates :lat, numericality: { only_float: true }
  validates :lng, numericality: { only_float: true }
end
