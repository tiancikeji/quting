class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.integer :medium_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
