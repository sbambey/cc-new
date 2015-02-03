class RemoveRemovedFromFlies < ActiveRecord::Migration
  def change
  	remove_column :flies, :removed, :boolean
  end
end
