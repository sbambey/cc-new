# == Schema Information
#
# Table name: flies
#
#  id                       :integer          not null, primary key
#  name                     :string
#  position                 :string
#  website                  :string
#  equipment                :string
#  base                     :string
#  intro                    :text
#  content                  :text
#  flight_time              :hstore
#  rating                   :hstore
#  medical                  :hstore
#  additional               :hstore
#  posting_date_as_string   :string
#  posting_expiry_as_string :string
#  posting_date_as_date     :date
#  posting_expiry_as_date   :date
#  content_selector         :text
#  untracked                :boolean
#  airline_id               :integer
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require "rails_helper"

feature "Creating a fly" do

	given(:admin) { create(:admin) }
	given(:airline) { create(:airline) }
	given(:fly) { build(:fly) }

	before do 
		manual_sign_in admin
		visit new_airline_fly_path(airline)
	end
	
	scenario "with proper information" do
		fill_in "Opportunity name", with: fly.name
		fill_in "Position", with: fly.position
		fill_in "Equipment", with: fly.equipment
		fill_in "Base", with: fly.base
		fill_in "Expires", with: fly.posting_expiry_as_string
		fill_in "Website", with: fly.website

		fill_in "Total Time", with: fly.total_time
		fill_in "Total Multi-Engine", with: fly.multi_time
		fill_in "Total Multi-Engine PIC", with: fly.multi_pic_time
		fill_in "Total Turbine", with: fly.turbine_time
		fill_in "Total Turbine PIC", with: fly.turbine_pic_time
		fill_in "Total Turbofan/Turboprop", with: fly.turbofan_time
		fill_in "Total Turbofan/Turboprop PIC", with: fly.turbofan_pic_time

		find(:css, "#fly_atpl").set(fly.atpl)

		find(:css, "#fly_medical_license").set(fly.medical_license)

		find(:css, "#fly_work_right").set(fly.work_right)
		find(:css, "#fly_valid_passport").set(fly.valid_passport)
		find(:css, "#fly_background_check").set(fly.background_check)
		find(:css, "#fly_drug_test").set(fly.drug_test)
		find(:css, "#fly_drivers_license").set(fly.drivers_license)

		fill_in "Content selector", with: fly.content_selector

		click_button "Add opportunity"

		expect(page).to have_content "Added opportunity successfully!"
		expect(page).to have_content fly.name
	end
end