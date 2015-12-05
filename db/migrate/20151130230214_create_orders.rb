class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.string :status
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
