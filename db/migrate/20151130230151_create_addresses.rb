class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
