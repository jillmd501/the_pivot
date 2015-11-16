class AddDescriptionsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :short_d, :string
    add_column :cities, :long_d, :string
  end
end
