class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :country
      t.text :recruitment_overview_page
      t.text :content_selector
      t.text :title_selector
      t.boolean :untracked
      t.string :slug
      t.index :slug

      t.timestamps null: false
    end
  end
end
