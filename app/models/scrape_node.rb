class ScrapeNode < ActiveRecord::Base
	belongs_to :node_set, class_name: "ScrapeNodeSet", foreign_key: "scrape_node_set_id"
	belongs_to :scrapeable, polymorphic: true
	has_one :notice, class_name: "AdminNotice", dependent: :destroy
	serialize :titles, Array

	TYPES = { parent: 1, child: 0 }

	def parent?
		self.node_type == TYPES[:parent] ? true : false
	end

	def new_notice(matched_node)

		notice = AdminNotice.new(listable: scrapeable, node: self)

		if html == matched_node.try(:html) && titles == matched_node.try(:titles)
			notice.status = AdminNotice::STATUSES[:success]
		elsif html == matched_node.try(:html) || titles == matched_node.try(:titles) 
			notice.status = AdminNotice::STATUSES[:warning]
		else
			notice.status = AdminNotice::STATUSES[:danger]
		end

		return notice
	end

end
