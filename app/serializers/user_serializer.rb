class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :full_name, :email, :facebook_id, :password_digest, :diving_level, :total_dive_time, :number_of_dives

  has_many :logs
  has_many :dive_sites
  
  def number_of_dives
    object.logs.length
  end

  def total_dive_time
    object.logs.map(&:dive_time).inject(:+)
  end

  def full_name
  "#{object.first_name} #{object.last_name}"
  end

end
