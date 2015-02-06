class EmailService

	def initialize(params)
		@email_weekly = params[:email_weekly]
		@email_urgent = params[:email_urgent]
		@email = params[:email]
		@full_name = params[:full_name]
	end

	def subscribe
		subscribe_to_list(mail_params(weekly_list)) if @email_weekly == "1"
		subscribe_to_list(mail_params(urgent_list)) if @email_urgent == "1"
	end

	private

	def mailchimp_service
		Gibbon::API.new
	end

	def weekly_list
		"2bf3689aa0"
	end

	def urgent_list
		"d0c2203a08"
	end

	def mail_params(list)
		{
			id: list,
			email: {email: @email},
			merge_vars: {:FLNAME => @full_name},
			double_optin: false
		}
	end

	def subscribe_to_list(params)
		mailchimp_service.lists.subscribe(params)
	end

end