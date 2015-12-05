class AddPriceToSize < ActiveRecord::Migration
  def change
  	add_column :sizes, :price, :integer
  end
end
