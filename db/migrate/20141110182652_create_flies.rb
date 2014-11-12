class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
      t.string :name
      t.string :position
      t.string :expiration
      t.string :website
      t.belongs_to :airline

      t.timestamps null: false
    end
  end
end
