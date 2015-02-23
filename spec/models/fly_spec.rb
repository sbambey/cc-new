require 'rails_helper'

describe Fly, :type => :model do
  
	let(:fly) { build(:fly) }

	subject { fly }

	# Associations

	it { is_expected.to belong_to(:airline) }
	it { is_expected.to have_many(:notices) }
	it { is_expected.to have_many(:nodes) }
	it { is_expected.to have_many(:fly_user_type_ratings) }
	it { is_expected.to have_many(:type_ratings) }

	it { is_expected.to accept_nested_attributes_for(:fly_user_type_ratings) }
	context "#fly_user_type_ratings, #type_ratings - dependent: destroy" do
		before do
			fly.save
			type_rating = create(:type_rating)
			create(:fly_user_type_rating, user: nil, fly: fly, type_rating: type_rating)
		end

		it "destroys dependent records" do
			expect{fly.destroy}.to change(FlyUserTypeRating, :count).by(-1).and change(TypeRating, :count).by(0)
		end
	end

	##

	it { should serialize(:added_requirements) }

	context "#slug" do
		it do
			fly.save
			expect(subject.attributes["slug"]).to_not be_nil
		end
	end

	# Validations

	describe "#rating" do
		context "when given a value other than RATINGS or ''" do
			before { fly.rating = "foo" }
			it { is_expected.to_not be_valid }
		end

		context "when given ''" do
			before { fly.rating = "" }
			it { is_expected.to be_valid }
		end
	end

	context "#medical_license" do
		context "when given a value other than MEDICAL_LICENSES" do
			before { fly.medical_license = "foo" }
			it { is_expected.to_not be_valid }
		end

		context "when given ''" do
			before { fly.medical_license = "" }
			it { is_expected.to be_valid }
		end
	end

	# Class methods and scopes

	context "default scope" do
		let!(:existing_fly) { create(:fly) }
		let!(:deleted_fly) { create(:fly, deleted_at: Time.now) }
				
		it "selects existing flies" do
			expect(Fly.all).to eq([existing_fly])
		end
	end

	context ".deleted" do
		let!(:existing_fly) { create(:fly) }
		let!(:deleted_fly) { create(:fly, deleted_at: Time.now) }
						
		it "selects deleted flies" do
			expect(Fly.deleted).to eq([deleted_fly])
		end
	end

	context ".active" do
		let!(:active_fly) { create(:fly) }
		let!(:inactive_fly) { create(:fly, general_recruitment: true)}

		it "selects active flies" do
			expect(Fly.active).to eq([active_fly])
		end
	end

	context ".inactive" do
		let!(:active_fly) { create(:fly) }
		let!(:inactive_fly) { create(:fly, general_recruitment: true)}

		it "selects inactive flies" do
			expect(Fly.inactive).to eq([inactive_fly])
		end
	end

	# Instance methods and accessors

	context "responds to added accessors" do
		it { is_expected.to respond_to(:total_time) }
		it { is_expected.to respond_to(:atp_qualifications) }
	end

	context "#flight_time_requirements" do
		it "returns only non-zero requirements" do
			fly = build(:fly, total_time: "100", multi_pic_time: "10")
			expect(fly.flight_time_requirements).to eq({total_time: "100", multi_pic_time: "10"})
		end
	end

	context "#ordered_requirements_by_type" do
		let(:fly) { build(:fly, total_pic_time: "200", total_time: "100") }
		it "returns an ordered Hash with only non-zero values" do
			expect(fly.ordered_requirements_by_type(:flight_time, FLIGHT_HOUR_TYPES)).to eq({total_time: "100", total_pic_time: "200"})
		end
	end
end
