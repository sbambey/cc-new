class AddJustRegisteredToUser < ActiveRecord::Migration
  def change
    add_column :users, :just_registered, :boolean, default: true
  end
end
