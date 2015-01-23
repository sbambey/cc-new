class AddFlightExperienceToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :flight_experience, :hstore
  end
end
