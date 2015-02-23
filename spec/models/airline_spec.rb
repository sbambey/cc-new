require 'rails_helper'

describe Airline, :type => :model do
  
	let(:airline) { build(:airline) }
	let(:airline_with_image) { build(:airline) }

	subject { airline }

	# Associations
	it { is_expected.to have_many(:flies) }
	it { is_expected.to have_many(:notices) }
	it { is_expected.to have_many(:node_sets) }
	it { is_expected.to have_many(:nodes) }

	# Attachments
	it "has a properly formatted image" do
		subject { airline_with_image }
		is_expected.to have_attached_file(:logo)
		is_expected.to validate_attachment_content_type(:logo).
		                allowing('image/png', 'image/gif').
		                rejecting('text/plain', 'text/xml')
	end

	# Validations
	it { is_expected.to be_valid }
	it { is_expected.to validate_presence_of(:name) }

	# Class methods and scopes
	describe "responds to class methods and scopes" do
		it "shows all untracked airlines" do
			untracked = airline
			untracked.save
			create(:airline, no_track: true)

			expect(Airline.untracked).to eq([untracked])
		end
	end

	# Instance methods
	describe "responds to instance methods" do
		# empty
	end
end
