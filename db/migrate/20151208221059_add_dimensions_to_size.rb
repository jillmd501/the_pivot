class AddDimensionsToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :dimension, :string
  end
end
