class AddIntroRequirementsContentToFly < ActiveRecord::Migration
  def change
    add_column :flies, :intro, :text
    add_column :flies, :requirements, :text
    add_column :flies, :content, :text
  end
end
