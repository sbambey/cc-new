def fill_in_sign_up_fields
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	fill_in "Password confirmation", with: user.password_confirmation
	fill_in "Full name", with: user.full_name
end

def manual_sign_in(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def merge_in_hstore(attributes)
	new_attributes = {}
	attributes.each do |key, value|
		if value.is_a?(Hash)
			new_attributes = new_attributes.merge(value)
		else
			new_attributes = new_attributes.merge({key => value})
		end
	end
	new_attributes
end		