require 'rails_helper'

describe Airline, :type => :model do
  
	let(:airline) { build(:airline) }

	subject { airline }

	it "responds to attributes" do
		is_expected.to respond_to(:name)
		is_expected.to respond_to(:country)
  	is_expected.to respond_to(:recruitment_overview_page)
  	is_expected.to respond_to(:content_selector)
  	is_expected.to respond_to(:title_selector)
  	is_expected.to respond_to(:no_track)
  	is_expected.to respond_to(:slug)
  	is_expected.to respond_to(:logo_file_name)
  	is_expected.to respond_to(:logo_content_type)
  	is_expected.to respond_to(:logo_file_size)
  	is_expected.to respond_to(:logo_updated_at)
	end

	describe "responds to instance methods" do
		describe "#has_active_recruitment?" do
			context "airline with flies" do
				it "has active recruitment" do
					airline_with_flies = create(:airline)
					create(:fly, airline: airline_with_flies)

					expect(airline_with_flies.has_active_recruitment?).to be true 
				end
			end

			context "airline without flies" do
				it "does not have active recruitment" do
					airline_without_flies = create(:airline)
				
					expect(airline_without_flies.has_active_recruitment?).to be false
				end
			end

			context "airline with only no_match flies" do
				it "does not have active recruitment" do
					airline_with_no_match_flies = create(:airline)
					create(:fly, no_match: true, airline: airline_with_no_match_flies)

					expect(airline_with_no_match_flies.has_active_recruitment?).to be false
				end
			end
		end
	end

	describe "responds to class methods and scopes" do
		it "shows all untracked airlines" do
			create(:airline)
			untracked = create(:airline, no_track: false)

			expect(Airline.untracked).to eq([untracked])
		end
	end

	describe "#name" do
		context "when given an empty string" do
			before { airline.name = " " }
			it { is_expected.to_not be_valid }
		end
	end
end
