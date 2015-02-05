class AddGeneralRecruitmentToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :general_recruitment, :boolean, default: false
  end
end
