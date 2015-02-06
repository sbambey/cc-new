class AddEmailCheckinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_weekly, :boolean, default: false
    add_column :users, :email_urgent, :boolean, default: false
  end
end
