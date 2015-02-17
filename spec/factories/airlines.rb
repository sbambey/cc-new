FactoryGirl.define do
  factory :airline, class: Airline do
    name "Test Airline"
    country "United States of America"
    no_track true
  end
end