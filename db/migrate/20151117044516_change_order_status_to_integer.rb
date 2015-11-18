class ChangeOrderStatusToInteger < ActiveRecord::Migration
  def change
    remove_column :orders, :status
    add_column :orders, :status, :integer
  end
end
