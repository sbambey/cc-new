class CreateScrapeNodeSets < ActiveRecord::Migration
  def change
    create_table :scrape_node_sets do |t|
    	t.belongs_to :airline

      t.timestamps null: false
    end
  end
end
