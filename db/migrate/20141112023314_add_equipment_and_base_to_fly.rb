class AddEquipmentAndBaseToFly < ActiveRecord::Migration
  def change
  	add_column :flies, :equipment, :string
  	add_column :flies, :base, :string
  end
end
