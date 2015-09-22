class ChangePackagesColumn < ActiveRecord::Migration
  def change
    remove_column :packages, :median_price, :float, null: false
    add_column :packages, :price, :integer, null: false
  end
end
