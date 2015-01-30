desc "Modifies flight experience"

task :remove_turbofan => :environment do

  User.record_timestamps = false
  Fly.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.flight_time.delete("turbofan_time")
      user.flight_time.delete("turbofan_pic_time")
      puts user.id
      user.save!
    end
  end

  Fly.all.each do |fly|
    Fly.transaction do
      fly.flight_time.delete("turbofan_time")
      fly.flight_time.delete("turbofan_pic_time")
      puts fly.id
      fly.save!
    end
  end

  User.record_timestamps = true
  Fly.record_timestamps = true

end