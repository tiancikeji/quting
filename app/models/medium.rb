class Medium < ActiveRecord::Base
  attr_accessible :type, :url, :name, :author, :yanbo, :jishu, :time, :category, :updatetime, :description
end
