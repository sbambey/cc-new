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
