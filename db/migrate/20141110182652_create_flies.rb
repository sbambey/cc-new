class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
      t.string :name
      t.string :position
      t.string :website
      t.string :equipment
      t.string :base
      t.text :intro
      t.text :content
      t.hstore :flight_time
      t.hstore :rating
      t.hstore :medical
      t.hstore :additional
      t.string :posting_date_as_string
      t.string :posting_expiry_as_string
      t.date :posting_date_as_date
      t.date :posting_expiry_as_date
      t.boolean :staged
      t.belongs_to :airline
      t.string :slug
      t.index :slug

      t.timestamps null: false
    end
  end
end
