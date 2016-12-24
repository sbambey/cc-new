class RemoveSeveralFieldsFromFly < ActiveRecord::Migration
  def change
  	remove_column :flies, :position
  	remove_column :flies, :equipment
  	remove_column :flies, :base
  	remove_column :flies, :updated
  	remove_column :flies, :general_recruitment
  	remove_column :flies, :company_website
  end
end
