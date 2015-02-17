require "rails_helper"

feature "Creating an airline" do

	given(:admin) { create(:admin) }
	given(:airline) { build(:airline) }

	before do 
		manual_sign_in admin
		visit new_airline_path
	end
	
	scenario "with proper information" do
		fill_in "Airline name", with: airline.name
		fill_in "Country", with: airline.country
		find(:css, "#airline_no_track").set(airline.no_track)
		click_button "Add airline"

		expect(page).to have_content "Created airline successfully!"
		expect(page).to have_content airline.name
	end
end