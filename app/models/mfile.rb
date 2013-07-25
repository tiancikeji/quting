class Mfile < ActiveRecord::Base
  attr_accessible :medium_id, :name, :time, :url
  mount_uploader :url, AudioUploader
  belongs_to :media
end
