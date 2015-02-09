desc "Modifies float rating"

task :float => :environment do

  User.record_timestamps = false
  Fly.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.float_multi = "0"
      puts user.id
      user.save!
    end
  end

  Fly.all.each do |fly|
    Fly.transaction do
      fly.float_multi = "0"
      puts fly.id
      fly.save!
    end
  end

  User.record_timestamps = true
  Fly.record_timestamps = true

end