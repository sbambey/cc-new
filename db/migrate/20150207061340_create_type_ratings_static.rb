class CreateTypeRatingsStatic < ActiveRecord::Migration
  def change
    create_table :type_ratings_static do |t|
      t.string :designation

      t.timestamps null: false
    end
  end
end
