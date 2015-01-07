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
		elsif node_type == TYPES[:parent] && (html == matched_node.try(:html) || titles == matched_node.try(:titles))
			notice.status = AdminNotice::STATUSES[:warning]
		else
			notice.status = AdminNotice::STATUSES[:danger]
		end

		return notice
	end

end
