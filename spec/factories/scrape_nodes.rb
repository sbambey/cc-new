# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scrape_node do
    html "MyText"
    flies 1
    titles ""
    airline_id 1
  end
end
