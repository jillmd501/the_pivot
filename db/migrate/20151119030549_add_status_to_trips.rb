class AddStatusToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :status, :integer
  end
end
