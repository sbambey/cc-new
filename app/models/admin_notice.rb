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

class AdminNotice < ActiveRecord::Base
	belongs_to :listable, polymorphic: true
	belongs_to :node, class_name: "ScrapeNode", foreign_key: "scrape_node_id"
	belongs_to :user
	serialize :missing_fields, Array

	STATUSES = { success: "success", warning: "warning", danger: "danger" }

	def self.create_status_from_similarity(similarity)
		if similarity[:html] && similarity[:titles]
			"success"
		elsif similarity[:titles]
			"warning"
		else
			"danger"
		end
	end
end
