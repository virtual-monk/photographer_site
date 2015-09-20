class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :location, null: false
      t.integer :years_experience, null: false
      t.string :portfolio_website
      t.integer :median_price
    end
  end
end
