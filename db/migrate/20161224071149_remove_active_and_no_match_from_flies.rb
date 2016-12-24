class RemoveActiveAndNoMatchFromFlies < ActiveRecord::Migration
  def change
  	remove_column :flies, :no_match
  	remove_column :flies, :active
  end
end
