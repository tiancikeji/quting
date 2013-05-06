class AddFildsToMedia < ActiveRecord::Migration
  def change
    add_column :media, :name, :string
    add_column :media, :author, :string
    add_column :media, :yanbo, :string
    add_column :media, :jishu, :string
    add_column :media, :time, :string
    add_column :media, :category, :string
    add_column :media, :updatetime, :string
    add_column :media, :description, :string
  end
end
