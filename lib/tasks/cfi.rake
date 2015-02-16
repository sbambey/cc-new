desc "Modifies instructor"

task :cfi => :environment do

  User.record_timestamps = false
  Fly.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.cfi = "0"
      user.cfii = "0"
      user.mei = "0"
      puts user.id
      user.save!
    end
  end

  Fly.all.each do |fly|
    Fly.transaction do
      fly.cfi = "0"
      fly.cfii = "0"
      fly.mei = "0"
      puts fly.id
      fly.save!
    end
  end

  User.record_timestamps = true
  Fly.record_timestamps = true

end