class LogSerializer < ActiveModel::Serializer
  attributes :id, :date, :dive_time, :gear, :comments, :visibility, :temperature, :image
  has_one :user
  belongs_to :dive_site
end
