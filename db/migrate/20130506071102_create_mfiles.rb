class CreateMfiles < ActiveRecord::Migration
  def change
    create_table :mfiles do |t|
      t.integer :medium_id
      t.string :time
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
