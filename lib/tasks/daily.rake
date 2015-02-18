desc "Send out daily mails"

task :daily => :environment do

  User.where("email = ?", "simon@flightcrew.io").each do |u|

    previous_matched_fly = u.matched_flies.last

    matched_fly = MatchedFly.new

    find_matching_flies = FlyMatchingService.new({
      flight_time: u.flight_time,
      medical_license: u.medical_license,
      rating: u.rating,
      flight_experience: u.flight_experience,
      type_ratings: u.type_ratings
    }).flies

    find_matching_flies.each do |fly|
      matched_fly.matched << fly.id
    end

    matched_fly.user_id = u.id

    matched_fly.save

    if(matched_fly.matched - previous_matched_fly.matched != [])
      difference = matched_fly.matched - previous_matched_fly.matched

      to_email = difference[0..2]

      to_email.map { |id| Fly.find(id) }

      UserMailer.daily_jobs(u, to_email).deliver
    end
  end
end