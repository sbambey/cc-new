desc "Modifies flight experience"

task :general_recruitment => :environment do

  Fly.record_timestamps = false

  Fly.where("name like ?", "%General recruitment%").each do |fly|
    Fly.transaction do
      fly.general_recruitment = true
      puts fly.id
      fly.save!
    end
  end

  Fly.record_timestamps = true

end