FactoryGirl.define do
  factory :airline, class: Airline do
    name "Test Airline"
    country "United States of America"
    recruitment_overview_page "http://www.samplewebsite.com"
    content_selector ".content"
    title_selector ".title"
    no_track false
  end

  factory :airline_with_image, class: Airline do
  	name "Test Airline"
    country "United States of America"
    recruitment_overview_page "http://www.samplewebsite.com"
    content_selector ".content"
    title_selector ".title"
    logo { fixture_file_upload(Rails.root.join('spec', 'images', 'test.png'), 'image/png') }
    no_track false
  end
end