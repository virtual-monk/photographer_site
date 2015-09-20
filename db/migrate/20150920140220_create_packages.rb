class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.float :median_price, null: false
    end
  end
end
