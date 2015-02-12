desc "Sets just registered to false for ecisting users"

task :just_registered => :environment do

  User.record_timestamps = false
	
  User.all.each do |user|
    User.transaction do
      user.just_registered = false
      puts user.id
      user.save!
    end
  end

  User.record_timestamps = true

end