# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  full_name              :string
#  birthdate              :date
#  nationality            :string
#  language               :string
#  high_school_diploma    :boolean
#  post_secondary_degree  :boolean
#  flight_time            :hstore
#  rating                 :hstore
#  medical                :hstore
#  additional             :hstore
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean
#

require 'rails_helper'

describe User, :type => :model do
  
	let(:user) { build(:user) }

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

	describe "#birthdate" do
		context "when given a nil value" do
			before { user.birthdate = nil }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#nationality" do
		context "when given an empty string" do
			before { user.nationality = " " }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#language" do
		context "when not given am empty string" do
			before { user.language = " " }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#high_school_diploma" do
		context "when given a value other than true/false" do
			before { user.high_school_diploma = "foo" }
			#it { is_expected.to_not be_valid }
		end
	end

	describe "#post_secondary_degree" do
		context "when given a value other than true/false" do
			before { user.post_secondary_degree = "foo" }
			#it { is_expected.to_not be_valid }
		end
	end

	#flight time
	describe "#total_time" do
		context "when not given a numeric value" do
			before { user.total_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#total_pic_time" do
		context "when not given a numeric value" do
			before { user.total_pic_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#multi_time" do
		context "when not given a numeric value" do
			before { user.multi_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#multi_pic_time" do
		context "when not given a numeric value" do
			before { user.multi_pic_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#turbine_time" do
		context "when not given a numeric value" do
			before { user.turbine_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#turbine_pic_time" do
		context "when not given a numeric value" do
			before { user.turbine_pic_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#turbofan_time" do
		context "when not given a numeric value" do
			before { user.turbofan_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#turbofan_time" do
		context "when not given a numeric value" do
			before { user.turbofan_pic_time = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#atpl" do
		context "when given a value other than true/false" do
			before { user.atpl = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	#medical
	describe "#medical_license" do
		context "when given a value other than true/false" do
			before { user.medical_license = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	#additional
	describe "#work_right" do
		context "when given a value other than true/false" do
			before { user.work_right = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#valid_passport" do
		context "when given a value other than true/false" do
			before { user.valid_passport = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#background_check" do
		context "when given a value other than true/false" do
			before { user.background_check = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#drug_test" do
		context "when given a value other than true/false" do
			before { user.drug_test = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

	describe "#drivers_license" do
		context "when given a value other than true/false" do
			before { user.drivers_license = "foo" }
			it { is_expected.to_not be_valid }
		end
	end

end
