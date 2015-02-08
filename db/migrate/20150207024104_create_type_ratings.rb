class CreateTypeRatings < ActiveRecord::Migration
  def change
    create_table :type_ratings do |t|
      t.string :designation
      t.datetime :issuance
      t.boolean :current
      t.belongs_to :user
      t.belongs_to :fly

      t.timestamps null: false
    end
  end
end
