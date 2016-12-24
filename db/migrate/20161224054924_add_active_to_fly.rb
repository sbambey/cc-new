class AddActiveToFly < ActiveRecord::Migration
  def change
  	add_column :flies, :active, :boolean
  end
end
