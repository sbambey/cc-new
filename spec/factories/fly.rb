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
    intro "blub"
    content "blub"
    flight_time { {"total_time" => "100", "total_pic_time" => "10", "multi_time" => "10", "multi_pic_time" => "10", 
	  	"turbine_time" => "10", "turbine_pic_time" => "10", "turbofan_time" => "40", "turbofan_pic_time" => "10"} }
	  rating { {"atpl" => "1"} }
	  medical { {"medical_license" => "1"} }
	  additional { {"work_right" => "1", "valid_passport" => "1", "background_check" => "1", "drug_test" => "1", 
	  	"drivers_license" => "1"} }
	  posting_date_as_string "10th of Jan 2080"
	  posting_date_as_date Date.yesterday
	  posting_expiry_as_string "10th of Feb 2080"
	  posting_expiry_as_date Date.today
	  untracked true
	  airline
  end
end