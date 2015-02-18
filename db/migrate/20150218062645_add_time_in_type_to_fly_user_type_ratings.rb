class AddTimeInTypeToFlyUserTypeRatings < ActiveRecord::Migration
  def change
    add_column :fly_user_type_ratings, :time_in_type, :integer
  end
end
