desc "Send out daily mails"

task :daily => :environment do

  User.where("email = ?", "simon@flightcrew.io").each do |u|

    previous_matched_fly = u.matched_flies.last || MatchedFly.create(id: u.id, matched: [])

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

      to_email = difference[0..2].map { |id| Fly.find(id) }

      lala = UserMailer.daily_jobs(u, to_email)

      puts lala.attributes
    end
  end
end