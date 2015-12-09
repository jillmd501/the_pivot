class AddSlugToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :slug, :string
  end
end
