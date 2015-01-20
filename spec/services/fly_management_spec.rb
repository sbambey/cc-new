require "./app/services/fly_matching_service"

describe FlyMatchingService  do
	let(:fly_matching_service) { FlyMatchingService.new({flight_time: {"total_time" => "100"}}) }
	let(:fly_without_req) {  }
end