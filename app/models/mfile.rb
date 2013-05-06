class Mfile < ActiveRecord::Base
  attr_accessible :medium_id, :name, :time, :url
  belongs_to :media
end
