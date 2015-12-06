class AddSizeToOrderPhoto < ActiveRecord::Migration
  def change
  	add_column :order_photos, :size_id, :integer
  end
end
