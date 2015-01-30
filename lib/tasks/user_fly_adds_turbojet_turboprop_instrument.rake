desc "Modifies flight experience"

task :add_turbojet => :environment do

  User.record_timestamps = false
  Fly.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.turbojet_time = user.turbofan_time
      user.turbojet_pic_time = user.turbofan_pic_time
      user.turboprop_time = "0"
      user.turboprop_pic_time = "0"
      user.simulated_instrument = "0"
      puts user.id
      user.save!
    end
  end

  Fly.all.each do |fly|
    Fly.transaction do
      fly.turbojet_time = fly.turbofan_time
      fly.turbojet_pic_time = fly.turbofan_pic_time
      fly.turboprop_time = "0"
      fly.turboprop_pic_time = "0"
      fly.simulated_instrument = "0"
      puts fly.id
      fly.save!
    end
  end

  User.record_timestamps = true
  Fly.record_timestamps = true

end