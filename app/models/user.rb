class User < ApplicationRecord
  has_secure_password
  has_many :logs
  has_many :dive_sites, -> { distinct }, through: :logs


  validates :username, presence: true
  validates :email, format: { with: /.*@.*./, message: 'Invalid Email' }
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true, presence: true

end
