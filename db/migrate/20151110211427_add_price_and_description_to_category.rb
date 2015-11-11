class AddPriceAndDescriptionToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :price, :integer
    add_column :categories, :description, :string
    remove_column :cities, :price, :integer
  end
end
