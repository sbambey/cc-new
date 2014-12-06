class AddCountryToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :country, :string
  end
end
