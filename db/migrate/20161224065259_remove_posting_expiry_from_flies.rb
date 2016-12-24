class RemovePostingExpiryFromFlies < ActiveRecord::Migration
  def change
  	remove_column :flies, :posting_expiry_as_string
  	remove_column :flies, :posting_expiry_as_date
  end
end
