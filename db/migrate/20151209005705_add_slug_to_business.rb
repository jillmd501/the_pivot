class AddSlugToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :slug, :string
  end
end
