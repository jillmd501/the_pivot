class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :bio

      t.timestamps null: false
    end
  end
end
