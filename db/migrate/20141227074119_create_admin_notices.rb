class CreateAdminNotices < ActiveRecord::Migration
  def change
    create_table :admin_notices do |t|
      t.text :missing_fields
      t.string :status
      t.boolean :dismissed, default: false
      t.integer :fly_id
      t.integer :airline_id
      t.integer :scrape_node_id

      t.timestamps null: false
    end
  end
end
