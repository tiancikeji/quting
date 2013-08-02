class AddSortToMedium < ActiveRecord::Migration
  def change
    add_column :media, :sort, :integer
  end
end
