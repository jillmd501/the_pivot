class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.references :city, index: true, foreign_key: true
      t.integer :price
      t.string :description
      t.string :image_path

      t.timestamps null: false
    end

    drop_table :categories
  end
end
