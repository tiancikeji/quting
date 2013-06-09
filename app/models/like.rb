class Like < ActiveRecord::Base
  attr_accessible :medium_id, :user_id, :guest_id

  belongs_to :medium
  belongs_to :guest
end
