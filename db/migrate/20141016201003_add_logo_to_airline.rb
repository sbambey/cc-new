class AddLogoToAirline < ActiveRecord::Migration
  def self.up
    add_attachment :airlines, :logo
  end

  def self.down
    remove_attachment :airlines, :logo
  end
end
