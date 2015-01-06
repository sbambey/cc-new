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

require 'rails_helper'

RSpec.describe ScrapeNode, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
end
