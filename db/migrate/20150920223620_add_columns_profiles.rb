class AddColumnsProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer, null: false
    add_column :profiles, :category_id, :integer, array: true
    add_column :profiles, :packages_id, :integer, array: true
  end
end
