class AddColumnPackages < ActiveRecord::Migration
  def change
    add_column :packages, :profile_id, :integer, null: false
  end
end
