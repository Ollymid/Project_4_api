class LogSerializer < ActiveModel::Serializer
  attributes :id, :date, :dive_time, :gear, :comments, :visibility, :temperature, :image
  belongs_to :user
  belongs_to :dive_site
end
