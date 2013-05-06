class Medium < ActiveRecord::Base
  attr_accessible :mtype, :url, :name, :author, :yanbo,
    :jishu, :time, :category, :updatetime, :description
end
