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

FactoryGirl.define do
  factory :user, class: User do
    sequence(:email){|n| "testuser#{n}@cockpitcareers.com" }
    password "testtest"
    password_confirmation { "testtest" }
	  full_name "Test User"
	  birthdate Date.today
	  nationality "Test Nationality"
	  language "Sandynese"
	  high_school_diploma 1
	  post_secondary_degree 1
	  flight_time { {"total_time" => "0", "total_pic_time" => "0", "multi_time" => "0", "multi_pic_time" => "0", 
	  	"turbine_time" => "0", "turbine_pic_time" => "0", "turbojet_time" => "0", "turbojet_pic_time" => "0",
	  	"turboprop_time" => "0", "turboprop_pic_time" => "0",
	  	"night_time" => "0", "night_pic_time" => "0",
	  	"x_country_time" => "0", "x_country_pic_time" => "0",
	  	"instrument_time" => "0", "actual_instrument" => "0",
	  	"single_float_time" => "0", "multi_float_time" => "0" } }
  	flight_experience { { "atp_qualifications" => "0", "atp_written" => "0", "multi_engine" => "0", "instrument" => "0",
	  	"float" => "0" } }
	  rating RATINGS[:atpl_unrestricted]
	  medical_license MEDICAL_LICENSES[:one]

	  factory :admin do
	  	admin true
	  end
  end
end
