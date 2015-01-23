class AddFlightExperienceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flight_experience, :hstore
  end
end
