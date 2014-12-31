class CreateAdminNotices < ActiveRecord::Migration
  def change
    create_table :admin_notices do |t|
      t.text :fly_name
      t.string :status
      t.string :edited_by_name
      t.string :edited_by_email
      t.boolean :dismissed, default: false
      t.references :listable, polymorphic: true, index: true
      t.integer :scrape_node_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
