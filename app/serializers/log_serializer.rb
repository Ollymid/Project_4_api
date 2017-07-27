class LogSerializer < ActiveModel::Serializer
  attributes :id, :date, :dive_time, :gear, :comments, :visibility, :temperature, :image_src
  belongs_to :user
  belongs_to :dive_site

  def image_src
    object.image.url
  end
end
