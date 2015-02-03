desc "Modifies flight experience"

task :deleted_at => :environment do

  Fly.record_timestamps = false

  Fly.where("removed = true").each do |fly|
    Fly.transaction do
      fly.deleted_at = fly.updated_at
      puts fly.id
      fly.save!
    end
  end

  Fly.record_timestamps = true

end