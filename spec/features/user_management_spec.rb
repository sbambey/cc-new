require "rails_helper"

feature "Creating a user" do

	given(:user) { build(:user) }

	before { visit new_user_registration_path }

	scenario "with correct credentials" do
		fill_in_sign_up_fields
		#fill_in "Nationality", with: user.nationality
		#fill_in "Language", with: user.language
		#select user.birthdate.year, from: "user_birthdate_1i"
		#select user.birthdate.strftime("%B"), from: "user_birthdate_2i"
		#select user.birthdate.day, from: "user_birthdate_3i"

		click_button "Sign up"
		expect(page).to have_content "Welcome! You have signed up successfully."
		expect(page).to have_content "For the most accurate matching, modify your flight hours in your profile."
	end

	scenario "with no email" do
		fill_in_sign_up_fields

		fill_in "Email", with: ""

		click_button "Sign up"
		expect(page).to have_content "Email can't be blank"
	end

	scenario "with incorrect email" do
		fill_in_sign_up_fields

		fill_in "Email", with: "invalid.com"

		click_button "Sign up"
		expect(page).to have_content "Email is invalid"
	end

	scenario "with no password" do
		fill_in_sign_up_fields

		fill_in "Password", with: ""
		fill_in "Password confirmation", with: ""

		click_button "Sign up"
		expect(page).to have_content "Password can't be blank"
	end

	scenario "with non matching passwords" do
		fill_in_sign_up_fields

		fill_in "Password", with: "password11"
		fill_in "Password confirmation", with: "password22"

		click_button "Sign up"
		expect(page).to have_content "Password confirmation doesn't match Password"
	end

	scenario "with no full name" do
		fill_in_sign_up_fields

		fill_in "Full name", with: ""

		click_button "Sign up"
		expect(page).to have_content "Full name can't be blank"
	end
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
		updated_name = "New name"
		fill_in "Current password", with: user.password
		fill_in "Full name", with: updated_name
		click_button "Save changes"

		expect(page).to have_content "Your account has been updated successfully."

		visit root_path

		expect(page).to_not have_content "For the most accurate matching, modify your flight hours in your profile."

		click_link updated_name

		expect(page).to have_xpath("//input[@value='#{updated_name}']")
	end

	scenario "with incorrect credentials" do
		click_button "Save changes"

		expect(page).to have_content "Oh snap! There seem to be some errors in your form."
	end
end

feature "Logging out a user" do

	given(:user) { create(:user) }

	before { manual_sign_in user }

	scenario "clicking the logout button" do
		click_link "Logout"

		expect(page).to have_content "Signed out successfully."
	end
end