class CreateScrapeNodes < ActiveRecord::Migration
  def change
    create_table :scrape_nodes do |t|
      t.text :html
      t.integer :fly_count
      t.text :titles
      t.integer :airline_id

      t.timestamps null: false
    end
  end
end
