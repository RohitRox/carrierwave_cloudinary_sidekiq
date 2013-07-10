class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :project

      t.timestamps
    end
    add_index :photos, :project_id
  end
end
