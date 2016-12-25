class AddLocationToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :location, :string
  end
end
