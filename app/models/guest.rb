class Guest < ActiveRecord::Base
  attr_accessible :device_token
  has_many :likes
end
