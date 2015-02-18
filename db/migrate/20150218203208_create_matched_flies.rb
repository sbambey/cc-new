class CreateMatchedFlies < ActiveRecord::Migration
  def change
    create_table :matched_flies do |t|
      t.text :matched
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
