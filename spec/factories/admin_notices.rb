# == Schema Information
#
# Table name: admin_notices
#
#  id              :integer          not null, primary key
#  fly_name        :text
#  status          :string
#  edited_by_name  :string
#  edited_by_email :string
#  dismissed       :boolean          default("false")
#  listable_id     :integer
#  listable_type   :string
#  scrape_node_id  :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

=begin
FactoryGirl.define do
  factory :admin_notice do
    status "MyString"
    airline_id 1
    fly_id 1
  end
end
=end
