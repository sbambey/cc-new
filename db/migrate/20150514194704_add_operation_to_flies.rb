class AddOperationToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :operation, :string
  end
end
