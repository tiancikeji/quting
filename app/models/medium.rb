class Medium < ActiveRecord::Base
  attr_accessible :mtype, :url, :name, :author, :yanbo,
    :jishu, :time, :category, :updatetime, :description,
    :mfiles_attributes, :is_like, :sort

  has_many :mfiles
  mount_uploader :mtype, PictureUploader
  accepts_nested_attributes_for :mfiles, :allow_destroy => true

  
end
