# == Schema Information
#
# Table name: airlines
#
#  id                        :integer          not null, primary key
#  name                      :string
#  country                   :string
#  recruitment_overview_page :text
#  content_selector          :text
#  title_selector            :text
#  untracked                 :boolean
#  slug                      :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  logo_file_name            :string
#  logo_content_type         :string
#  logo_file_size            :integer
#  logo_updated_at           :datetime
#

FactoryGirl.define do
  factory :airline, class: Airline do
    name "Test Airline"
    country "United States of America"
    untracked true
  end
end