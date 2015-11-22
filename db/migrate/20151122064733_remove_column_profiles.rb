class RemoveColumnProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :years_experience
  end
end
