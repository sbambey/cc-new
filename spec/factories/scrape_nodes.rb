# == Schema Information
#
# Table name: scrape_nodes
#
#  id                 :integer          not null, primary key
#  node_type          :integer
#  html               :text
#  titles             :text
#  scrapeable_id      :integer
#  scrapeable_type    :string
#  scrape_node_set_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

=begin
FactoryGirl.define do
  factory :scrape_node do
    html "MyText"
    flies 1
    titles ""
    airline_id 1
  end
end
=end
