class FlyMatchingService
	include Hstoreable

	def initialize(params)
		@flight_time = strip_zero_times(params[:flight_time])
	end

	def flies
		@flies ||= find_flies
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
			query
		end
end