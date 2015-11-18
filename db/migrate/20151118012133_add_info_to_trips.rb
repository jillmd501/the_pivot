class AddInfoToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :info, :text
  end
end
