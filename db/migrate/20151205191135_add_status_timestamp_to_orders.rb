class AddStatusTimestampToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status_timestamp, :string
  end
end
