# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_notice do
    status "MyString"
    airline_id 1
    fly_id 1
  end
end
