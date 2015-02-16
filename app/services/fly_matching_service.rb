class FlyMatchingService
	include Hstoreable

	def initialize(params)
		@flight_time = params[:flight_time]
		@medical_license = params[:medical_license]
		@rating = params[:rating]
		@flight_experience = params[:flight_experience]
		@type_ratings = params[:type_ratings]
	end

	def flies
		@flies ||= find_flies.order(created_at: :desc)
	end

	private

		def strip_zero_times(times)
			stripped_times = {}
			times.each do |category, time|
				stripped_times[category] = time unless time == "0"
			end 
			stripped_times
		end

		def find_flies
			query = Fly

			query = query.where("flies.no_match = false")

			if @flight_time.present?
				@flight_time.each do |category, time|
					query = query.where("(flight_time -> ?)::int <= ?", category, time.to_i)
				end
			end

			if @medical_license == MEDICAL_LICENSES[:two]
				query = query.where("flies.medical_license != ?", MEDICAL_LICENSES[:one])
			elsif @medical_license != MEDICAL_LICENSES[:one]
				query = query.where("flies.medical_license != ? AND flies.medical_license != ?", MEDICAL_LICENSES[:one], MEDICAL_LICENSES[:two])
			end

			if @rating == RATINGS[:atpl_restricted]
				query = query.where("flies.rating != ?", RATINGS[:atpl_unrestricted])
			elsif @rating == RATINGS[:commercial]
				query = query.where("flies.rating != ? AND flies.rating != ?", RATINGS[:atpl_unrestricted], RATINGS[:atpl_restricted])
			elsif @rating != RATINGS[:atpl_unrestricted]
				query = query.where("flies.rating != ? AND flies.rating != ? AND flies.rating != ?", 
					RATINGS[:atpl_unrestricted], RATINGS[:atpl_restricted], RATINGS[:commercial])
			end

			if @rating == RATINGS[:commercial]
				@flight_experience.each do |category, bool|
					if bool != "1"
						query = query.where("(flight_experience -> ?) != ?", category, "1")
					end
				end
			elsif @rating == RATINGS[:atpl_unrestricted] || @rating == RATINGS[:atpl_restricted]
				if @flight_experience["multi_engine"] != "1"
					query = query.where("(flight_experience -> ?) != ?", :multi_engine, "1")
				end
			end

			query = query.reject { |r| !(r.type_ratings - @type_ratings == []) }

			query = Fly.where(id: query.map(&:id))

			query
		end
end