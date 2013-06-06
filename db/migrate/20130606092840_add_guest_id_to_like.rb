class AddGuestIdToLike < ActiveRecord::Migration
  def change
    add_column :likes, :guest_id, :integer
  end
end
