class AddIndices < ActiveRecord::Migration
  def change
  	add_index :flies, :airline_id
  	add_index :type_ratings, :fly_id
  	add_index :type_ratings, :user_id
  	add_index :airlines, :name
  	add_index :flies, :name
  	add_index :flies, :base
  	add_index :flies, :equipment
  end
end
