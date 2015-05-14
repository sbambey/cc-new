class AddShortNameToFly < ActiveRecord::Migration
  def change
    add_column :flies, :short_name, :string
  end
end
