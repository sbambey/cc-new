class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
      t.string :name
      t.string :position
      t.string :website
      t.string :equipment
      t.string :base
      t.hstore :flight_time
      t.string :rating
      t.string :medical_license
      t.string :posting_date_as_string
      t.string :posting_expiry_as_string
      t.date :posting_date_as_date
      t.date :posting_expiry_as_date
      t.text :content_selector
      t.boolean :no_track, default: false
      t.boolean :no_match, default: false
      t.belongs_to :airline
      t.string :slug
      t.index :slug

      t.timestamps null: false
    end
  end
end
