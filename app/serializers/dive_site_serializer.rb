class DiveSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :water_type, :dive_type, :lat, :lng, :max_depth, :country
  has_many :logs

end
