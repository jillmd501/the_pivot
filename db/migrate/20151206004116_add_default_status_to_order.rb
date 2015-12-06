class AddDefaultStatusToOrder < ActiveRecord::Migration
  def change
  	change_column_default :orders, :status, "Placed"
  end
end
