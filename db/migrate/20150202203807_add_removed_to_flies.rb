class AddRemovedToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :removed, :boolean, default: false
  end
end
