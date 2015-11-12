class AddOrderIdToOrderTrips < ActiveRecord::Migration
  def change
    add_reference :order_trips, :order, index: true, foreign_key: true
  end
end
