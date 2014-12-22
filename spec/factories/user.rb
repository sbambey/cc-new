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
	  flight_time { {"total_time" => "100", "total_pic_time" => "10", "multi_time" => "10", "multi_pic_time" => "10", 
	  	"turbine_time" => "10", "turbine_pic_time" => "10", "turbofan_time" => "40", "turbofan_pic_time" => "10"} }
	  rating { {"atpl" => "1"} }
	  medical { {"medical_license" => "1"} }
	  additional { {"work_right" => "1", "valid_passport" => "1", "background_check" => "1", "drug_test" => "1", 
	  	"drivers_license" => "1"} }
  end
end
