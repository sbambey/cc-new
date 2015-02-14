class CreateFlyUserTypeRatings < ActiveRecord::Migration
  def change
    create_table :fly_user_type_ratings do |t|
      t.integer :fly_id
      t.integer :user_id
      t.integer :type_rating_id
      t.datetime :issuance
      t.boolean :current
      t.boolean :pic

      t.timestamps null: false
    end
  end
end
