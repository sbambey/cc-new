class AddPicToTypeRatings < ActiveRecord::Migration
  def change
    add_column :type_ratings, :pic, :boolean
  end
end
