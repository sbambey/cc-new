class AddOngoingToFly < ActiveRecord::Migration
  def change
  	add_column :flies, :ongoing, :boolean
  end
end
