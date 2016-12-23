class AmendFlyWebsites < ActiveRecord::Migration
  def change
  	rename_column :flies, :website, :posting_website
  	add_column :flies, :company_website, :string
  end
end
