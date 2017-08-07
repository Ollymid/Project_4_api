class User < ApplicationRecord
  has_secure_password validations: false
  has_many :logs, dependent: :destroy
  has_many :dive_sites, dependent: :destroy
  has_many :dive_sites_created, class_name: "DiveSite", foreign_key: "user_id", dependent: :destroy
  has_many :dive_sites, -> { distinct }, through: :logs

  validates :username, uniqueness: true
  validates :diving_level, length: { in: 8..150 }, unless: :oauth_login?
  validates :username, presence: true
  validates :email, format: { with: /.*@.*./, message: 'Invalid Email' }
  validates :email, uniqueness: true, presence: true, unless: :oauth_login?
  validates :password, presence: true, confirmation: true, unless: :oauth_login?

  def oauth_login?
    facebook_id.present?
  end
end
