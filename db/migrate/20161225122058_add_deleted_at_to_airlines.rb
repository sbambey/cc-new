class AddDeletedAtToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :deleted_at, :datetime
  end
end
