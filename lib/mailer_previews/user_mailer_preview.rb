class UserMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/notifier/welcome
  def daily_jobs
    UserMailer.daily_jobs(User.first, [Fly.order("RANDOM()").first, Fly.order("RANDOM()").first, Fly.order("RANDOM()").first])
  end
end