class DiveSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_src, :water_type, :dive_type, :lat, :lng, :max_depth, :country
  has_many :logs
  has_many :users
  has_one :creator

  def image_src
    object.image.url
  end

end
