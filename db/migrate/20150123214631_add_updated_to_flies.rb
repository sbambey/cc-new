class AddUpdatedToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :updated, :boolean
  end
end
