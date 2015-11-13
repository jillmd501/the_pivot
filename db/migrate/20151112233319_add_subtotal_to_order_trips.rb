class AddSubtotalToOrderTrips < ActiveRecord::Migration
  def change
    add_column :order_trips, :subtotal, :integer
  end
end
