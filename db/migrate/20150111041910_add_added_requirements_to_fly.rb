class AddAddedRequirementsToFly < ActiveRecord::Migration
  def change
    add_column :flies, :added_requirements, :text
  end
end
