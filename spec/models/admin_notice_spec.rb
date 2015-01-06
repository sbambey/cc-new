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

require 'rails_helper'

RSpec.describe AdminNotice, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
end
