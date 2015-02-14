class DropTypeRatings < ActiveRecord::Migration
  def change
  	drop_table :type_ratings
  end
end
