class ScrapeNodeSet < ActiveRecord::Base
	belongs_to :airline
	has_many :nodes, class_name: "ScrapeNode", dependent: :destroy

	def matching_node(node)
		self.nodes.where("scrapeable_id = ? AND scrapeable_type = ?", node.scrapeable_id, node.scrapeable_type).first
	end

	def parent
		self.nodes.find_by(node_type: ScrapeNode::TYPES[:parent])
	end

	def children
		self.nodes.where(node_type: ScrapeNode::TYPES[:child])
	end

	def previous
		self.class.where(["airline_id = ? AND id < ?", airline_id, id]).last
	end

	def new_notices #UUUUUUGLY FIX THIS PLEASE
		previous_set = self.try(:previous)
		new_notices = []
		if previous_set
			self.nodes.each do |node|
				matched_node = previous_set.matching_node(node)
				new_notices << node.new_notice(matched_node)
			end
		else
			self.nodes.each do |node|
				new_notices << node.new_notice(nil)
			end
		end

		return new_notices
	end
end
