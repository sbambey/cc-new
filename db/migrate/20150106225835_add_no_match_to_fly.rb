class AddNoMatchToFly < ActiveRecord::Migration
  def change
    add_column :flies, :no_match, :boolean
  end
end
