class AddPicToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :pic, :string
  end
end
