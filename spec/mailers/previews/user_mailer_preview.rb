# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def daily_jobs
    UserMailer.daily_jobs(User.first, [Fly.order("RANDOM()").first, Fly.order("RANDOM()").first, Fly.order("RANDOM()").first])
  end
end
