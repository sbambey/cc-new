# == Schema Information
#
# Table name: scrape_node_sets
#
#  id         :integer          not null, primary key
#  airline_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

=begin
FactoryGirl.define do
  factory :scrape_node_set do
    scrape_node_id 1
    fly_id 1
  end
end
=end
