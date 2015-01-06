# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  manual_sign_in_count          :integer          default("0"), not null
#  current_manual_sign_in_at     :datetime
#  last_manual_sign_in_at        :datetime
#  current_manual_sign_in_ip     :inet
#  last_manual_sign_in_ip        :inet
#  full_name              :string
#  birthdate              :date
#  nationality            :string
#  language               :string
#  high_school_diploma    :boolean
#  post_secondary_degree  :boolean
#  flight_time            :hstore
#  rating                 :hstore
#  medical                :hstore
#  additional             :hstore
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean
#

require "rails_helper"

feature "Creating a user" do

	given(:user) { build(:user) }

	before { visit new_user_registration_path }

	scenario "with correct credentials" do
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		fill_in "Password confirmation", with: user.password_confirmation
		fill_in "Full name", with: user.full_name
		fill_in "Nationality", with: user.nationality
		fill_in "Language", with: user.language
		select user.birthdate.year, from: "user_birthdate_1i"
		select user.birthdate.strftime("%B"), from: "user_birthdate_2i"
		select user.birthdate.day, from: "user_birthdate_3i"

		click_button "Sign up"
		expect(page).to have_content "Welcome! You have signed up successfully."
	end

	##more found in controller tests

end

feature "Signing in a user" do

	given(:user) { create(:user) }

	before { visit new_user_session_path }

	scenario "with correct credentials" do
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Sign in"

		expect(page).to have_content "Signed in successfully."
	end	

	scenario "with incorrect credentials" do
		fill_in "Email", with: user.email
		fill_in "Password", with: "incorrect_password"
		click_button "Sign in"

		expect(page).to have_content "Invalid email or password."
	end
end

feature "Editing a user" do

	given(:user) { create(:user) }

	before do
		manual_sign_in user
		visit edit_user_registration_path
	end

	scenario "with correct credentials" do
		fill_in "Current password", with: user.password
		click_button "Edit information"

		expect(page).to have_content "Your account has been updated successfully."
	end

	scenario "with incorrect credentials" do
		click_button "Edit information"

		expect(page).to have_content "Oh snap! There seem to be some errors in your form."
	end
end