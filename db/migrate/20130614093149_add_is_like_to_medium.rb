class AddIsLikeToMedium < ActiveRecord::Migration
  def change
    add_column :media, :is_like, :integer, :default => 0
  end
end
