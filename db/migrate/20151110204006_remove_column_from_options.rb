class RemoveColumnFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :price, :integer
  end
end
