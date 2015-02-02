desc "Modifies flight experience"

task :modify_instrument => :environment do

  User.record_timestamps = false
  Fly.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.flight_time.delete("simulated_instrument")
      user.actual_instrument = "0"
      puts user.id
      user.save!
    end
  end

  Fly.all.each do |fly|
    Fly.transaction do
      fly.flight_time.delete("simulated_instrument")
      fly.actual_instrument = "0"
      puts fly.id
      fly.save!
    end
  end

  User.record_timestamps = true
  Fly.record_timestamps = true

end