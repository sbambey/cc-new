require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
	let(:user) { create(:user, email_urgent: true) }
	let(:flies) { [create(:fly)] }
	subject { UserMailer.daily_jobs(user, flies) }

  it "sends an email" do
    expect { subject.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it "renders the subject" do
  	expect(subject.subject).to eq("Your most recent pilot jobs")
  end

  it "renders the receiver email" do
  	expect(subject.to).to eq([user.email])
  end

  it "renders the sender email" do
  	expect(subject.from).to eq(["simon@flightcrew.io"])
  end

  it "assigns @user" do
  	expect(subject.body.encoded).to match(user.full_name)
  end

  it "assigns @flies" do
  	flies.each do |fly|
  		expect(subject.body.encoded).to match(fly.name)
  	end
  end
end
