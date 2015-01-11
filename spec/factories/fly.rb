# == Schema Information
#
# Table name: flies
#
#  id                       :integer          not null, primary key
#  name                     :string
#  position                 :string
#  website                  :string
#  equipment                :string
#  base                     :string
#  intro                    :text
#  content                  :text
#  flight_time              :hstore
#  rating                   :hstore
#  medical                  :hstore
#  additional               :hstore
#  posting_date_as_string   :string
#  posting_expiry_as_string :string
#  posting_date_as_date     :date
#  posting_expiry_as_date   :date
#  content_selector         :text
#  untracked                :boolean
#  airline_id               :integer
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

FactoryGirl.define do
  factory :fly, class: Fly do
    name "Test Opportunity"
    position "First Officer"
    website "http://test.com"
    equipment "Airbus A320"
    base "Sandyland"
    flight_time { {"total_time" => "100", "total_pic_time" => "10", "multi_time" => "10", "multi_pic_time" => "10", 
	  	"turbine_time" => "10", "turbine_pic_time" => "10", "turbofan_time" => "40", "turbofan_pic_time" => "10"} }
	  rating RATINGS[:atpl_unrestricted]
	  medical_license MEDICAL_LICENSES[:one]
	  added_requirements { ["some requirement", "some other requirement"] }
	  posting_date_as_string "10th of Jan 2080"
	  posting_date_as_date Date.yesterday
	  posting_expiry_as_string "10th of Feb 2080"
	  posting_expiry_as_date Date.today
	  no_track true
	  no_match false
	  airline
  end

  factory :fly_without_requirements, class: Fly do
    name "Test Opportunity"
    position "First Officer"
    website "http://test.com"
    equipment "Airbus A320"
    base "Sandyland"
    flight_time { {"total_time" => "0", "total_pic_time" => "0", "multi_time" => "0", "multi_pic_time" => "0", 
	  	"turbine_time" => "0", "turbine_pic_time" => "0", "turbofan_time" => "0", "turbofan_pic_time" => "0"} }
	  rating RATINGS[:atpl_unrestricted]
	  medical_license MEDICAL_LICENSES[:one]
	  added_requirements { ["some requirement", "some other requirement"] }
	  posting_date_as_string "10th of Jan 2080"
	  posting_date_as_date Date.yesterday
	  posting_expiry_as_string "10th of Feb 2080"
	  posting_expiry_as_date Date.today
	  no_track true
	  no_match false
	  airline
  end
end