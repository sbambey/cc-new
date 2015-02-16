require 'rails_helper'

describe FlyMatchingService do

	
	
	user = FactoryGirl.build(:user, total_time: "100")
	let(:service) { 
		FlyMatchingService.new(flight_time: user.flight_time, medical_license: user.medical_license, rating: user.rating,
			flight_experience: user.flight_experience) 
	}

	context "when no flies are matchable" do
		let(:fly_with_met_requirements) { FactoryGirl.create(:fly, total_time: "101") }
		let(:fly_with_unmet_requirements) { FactoryGirl.create(:fly, total_time: "101") }
	
		it "matches no flies" do
			expect(service.flies).to eq([])
		end
	end
end