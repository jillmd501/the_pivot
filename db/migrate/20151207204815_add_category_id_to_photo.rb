class AddCategoryIdToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :category, index: true, foreign_key: true
  end
end
