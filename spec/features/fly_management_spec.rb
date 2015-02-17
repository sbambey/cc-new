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
		#fill_in "Total Multi-Engine", with: fly.multi_time
		#fill_in "Total Multi-Engine PIC", with: fly.multi_pic_time
		#fill_in "Total Turbine", with: fly.turbine_time
		#fill_in "Total Turbine PIC", with: fly.turbine_pic_time
		#fill_in "Total Turbofan/Turboprop", with: fly.turbofan_time
		#fill_in "Total Turbofan/Turboprop PIC", with: fly.turbofan_pic_time

		select fly.rating, from: "fly_rating"

		select fly.medical_license, from: "fly_medical_license"

		fill_in "Content selector", with: fly.content_selector

		click_button "Add opportunity"

		expect(page).to have_content "Added opportunity successfully!"
		expect(page).to have_content fly.name
	end
end