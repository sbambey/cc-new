class AdminNotice < ActiveRecord::Base
	belongs_to :fly
	belongs_to :airline
	belongs_to :scrape_node
	serialize :missing_fields, Array

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
