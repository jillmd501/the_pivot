class AddImagePathToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :image_path, :string
  end
end
