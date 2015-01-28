class FlyMatchingService
	include Hstoreable

	def initialize(params)
		@flight_time = params[:flight_time]
		@medical_license = params[:medical_license]
		@rating = params[:rating]
		@flight_experience = params[:flight_experience]
	end

	def flies
		@flies ||= find_flies.order(updated_at: :desc)
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

			@flight_time.each do |category, time|
				query = query.where("(flight_time -> ?)::int <= ?", category, time.to_i)
			end
			query = query.where("no_match = false")

			if @medical_license == MEDICAL_LICENSES[:two]
				query = query.where("medical_license != ?", MEDICAL_LICENSES[:one])
			elsif @medical_license != MEDICAL_LICENSES[:one]
				query = query.where("medical_license != ? AND medical_license != ?", MEDICAL_LICENSES[:one], MEDICAL_LICENSES[:two])
			end

			if @rating == RATINGS[:atpl_restricted]
				query = query.where("rating != ?", RATINGS[:atpl_unrestricted])
			elsif @rating == RATINGS[:commercial]
				query = query.where("rating != ? AND rating != ?", RATINGS[:atpl_unrestricted], RATINGS[:atpl_restricted])
			elsif @rating != RATINGS[:atpl_unrestricted]
				query = query.where("rating != ? AND rating != ? AND rating != ?", 
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

			query
		end
end