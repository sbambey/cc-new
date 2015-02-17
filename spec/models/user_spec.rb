require 'rails_helper'

describe User, :type => :model do
  
	let(:user) { build(:user) }

	subject { user }

	it "responds to instance methods" do
		# empty
	end

	describe "responds to class methods and scopes" do
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

	describe "#rating" do
		context "when given a value other than RATINGS" do
			before { user.rating = "foo" }
			it { is_expected.to_not be_valid }
		end

		context "when given ''" do
			before { user.rating = "" }
			it { is_expected.to be_valid }
		end
	end

	#medical
	describe "#medical_license" do
		context "when given a value other than MEDICAL_LICENSES" do
			before { user.medical_license = "foo" }
			it { is_expected.to_not be_valid }
		end

		context "when given ''" do
			before { user.medical_license = "" }
			it { is_expected.to be_valid }
		end
	end

end
