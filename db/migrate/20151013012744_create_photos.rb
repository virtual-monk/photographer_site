class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id, null: false
      t.string :photo, null: false

      t.timestamps null: false
    end
  end
end