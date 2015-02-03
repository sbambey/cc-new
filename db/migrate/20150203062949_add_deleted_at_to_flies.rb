class AddDeletedAtToFlies < ActiveRecord::Migration
  def change
  	add_column :flies, :deleted_at, :datetime
  end
end
