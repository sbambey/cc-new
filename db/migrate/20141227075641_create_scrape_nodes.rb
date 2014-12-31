class CreateScrapeNodes < ActiveRecord::Migration
  def change
    create_table :scrape_nodes do |t|
    	t.integer :node_type
      t.text :html
      t.text :titles
      t.references :scrapeable, polymorphic: true, index: true
      t.integer :scrape_node_set_id

      t.timestamps null: false
    end
  end
end
