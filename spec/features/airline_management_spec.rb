# == Schema Information
#
# Table name: airlines
#
#  id                        :integer          not null, primary key
#  name                      :string
#  country                   :string
#  recruitment_overview_page :text
#  content_selector          :text
#  title_selector            :text
#  untracked                 :boolean
#  slug                      :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  logo_file_name            :string
#  logo_content_type         :string
#  logo_file_size            :integer
#  logo_updated_at           :datetime
#

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
		find(:css, "#airline_untracked").set(airline.untracked)
		click_button "Add airline"

		expect(page).to have_content "Created airline successfully!"
		expect(page).to have_content airline.name
	end
end