class Medium < ActiveRecord::Base
  attr_accessible :mtype, :url, :name, :author, :yanbo,
    :jishu, :time, :category, :updatetime, :description,
    :mfiles_attributes, :is_like

  has_many :mfiles

  accepts_nested_attributes_for :mfiles, :allow_destroy => true

  
end
