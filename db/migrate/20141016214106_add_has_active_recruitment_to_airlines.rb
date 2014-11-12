class AddHasActiveRecruitmentToAirlines < ActiveRecord::Migration
  def change
  	 add_column :airlines, :has_active_recruitment, :boolean, default: false
  end
end
