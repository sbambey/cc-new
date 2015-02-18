class UserMailer < ApplicationMailer
	default from: "simon@flightcrew.io"

	def daily_jobs(user, flies)
		@user = user
		@flies = flies

		mail(to: @user.email, subject: "Your most recent pilot jobs")
	end

	def weekly_jobs(user)

	end
end
