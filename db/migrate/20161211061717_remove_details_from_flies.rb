class RemoveDetailsFromFlies < ActiveRecord::Migration
  def change
  	remove_column :flies, :flight_time
  	remove_column :flies, :rating
  	remove_column :flies, :medical_license
  	remove_column :flies, :added_requirements
  	remove_column :flies, :flight_experience
  	remove_column :flies, :operation
  	add_column :flies, :content, :text
  end
end
