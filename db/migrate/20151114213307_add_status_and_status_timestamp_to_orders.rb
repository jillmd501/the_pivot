class AddStatusAndStatusTimestampToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :status_timestamp, :string
  end
end
