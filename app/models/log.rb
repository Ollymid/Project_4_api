class Log < ApplicationRecord
  belongs_to :user
  belongs_to :dive_site

  validates :dive_time, numericality: true
  validates :temperature, numericality: true 

end
