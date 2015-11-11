class AddColumnToCity < ActiveRecord::Migration
  def change
    add_column :cities, :price, :integer
  end
end
