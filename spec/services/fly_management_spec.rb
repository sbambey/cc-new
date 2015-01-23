require 'rails_helper'

describe FlyMatchingService  do
	before do
		@fly_matching_service = FlyMatchingService.new({flight_time: {"total_time" => "100"}})
		@fly_without_req = FactoryGirl.create(:fly_without_requirements)
		@fly_with_req = FactoryGirl.create(:fly_without_requirements, total_time: 100, total_pic_time: 100)
	end
	
	it "matches proper flies" do
		expect(@fly_matching_service.flies).to eq([@fly_without_req])
	end
end