class CreateOrderTrip < ActiveRecord::Migration
  def change
    create_table :order_trips do |t|
      t.integer :quantity
      t.references :trip, index: true, foreign_key: true
    end
  end
end
