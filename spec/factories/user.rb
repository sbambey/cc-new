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
  	flight_experience { { "mei" => "0", "cfi" => "0", "cfii" => "0", "float" => "0", "instrument" => "0", "atp_written" => "0", 
	  	"float_multi" => "0", "multi_engine" => "0", "atp_qualifications" => "0" } }
	  rating RATINGS[:atpl_unrestricted]
	  medical_license MEDICAL_LICENSES[:one]
	  email_weekly false
	  email_urgent false

	  factory :admin do
	  	admin true
	  end
  end
end
