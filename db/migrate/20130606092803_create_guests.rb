class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :device_token

      t.timestamps
    end
  end
end
