class AddPayToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :pay, :string
  end
end
