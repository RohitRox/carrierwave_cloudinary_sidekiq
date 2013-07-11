class AddPicTmpToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :pic_tmp, :string
  end
end
