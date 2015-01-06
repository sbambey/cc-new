require 'rails_helper'

describe Airline, :type => :model do
  
	let(:airline) { build(:user) }

	subject { user }

	it "responds to attributes" do
		is_expected.to respond_to(:email)

		is_expected.to respond_to(:full_name)
  	is_expected.to respond_to(:birthdate)
  	is_expected.to respond_to(:nationality)
  	is_expected.to respond_to(:language)
  	is_expected.to respond_to(:high_school_diploma)
  	is_expected.to respond_to(:post_secondary_degree)
  	is_expected.to respond_to(:total_time)
  	is_expected.to respond_to(:total_pic_time)
  	is_expected.to respond_to(:multi_time)
  	is_expected.to respond_to(:multi_pic_time)
  	is_expected.to respond_to(:turbine_time)
  	is_expected.to respond_to(:turbine_pic_time)
  	is_expected.to respond_to(:turbofan_time)
  	is_expected.to respond_to(:turbofan_pic_time)
  	is_expected.to respond_to(:atpl)
  	is_expected.to respond_to(:medical_license)
  	is_expected.to respond_to(:work_right)
  	is_expected.to respond_to(:valid_passport)
  	is_expected.to respond_to(:background_check)
  	is_expected.to respond_to(:drug_test)
  	is_expected.to respond_to(:drivers_license)
	end

	it "responds to instance methods" do
		# empty
	end

	describe "responds to class methods" do
		subject { User }
		#it { is_expected.to respond_to(:extract_attribute) }
		it { is_expected.to respond_to(:permissible_params) }
	end

	describe ".extract_attribute" do
		let(:hash) { {key1: "Key1", key2: "Key2"} }

		it "extracts the attribute (key)" do
			#expect(User.extract_attribute(hash)).to eq [:key1, :key2]
		end
	end

	it { is_expected.to be_valid }

	describe "#full_name" do
		context "when given an empty string" do
			before { user.full_name = " " }
			it { is_expected.to_not be_valid }
		end

		context "when given a value that is too long" do
			before { user.full_name = "a"*51 }
			it { is_expected.to_not be_valid }
		end
	end