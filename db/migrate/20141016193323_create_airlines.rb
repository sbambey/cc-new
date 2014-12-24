class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :country
      t.string :slug
      t.index :slug

      t.timestamps null: false
    end
  end
end
