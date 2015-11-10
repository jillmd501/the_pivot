class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
