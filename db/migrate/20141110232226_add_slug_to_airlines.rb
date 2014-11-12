class AddSlugToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :slug, :string
    add_index :airlines, :slug
  end
end
