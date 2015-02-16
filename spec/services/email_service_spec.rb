require 'rails_helper'

describe EmailService do
	service = EmailService.new({email_weekly: "1", email_urgent: "1", email: "test@test.com", full_name: "Test Name"})
	external_mail_service = double("Gibbon")

	

end