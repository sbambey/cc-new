class ScrapeNode < ActiveRecord::Base
	belongs_to :airline
	has_one :admin_notice
	serialize :titles, Array

	def same_as_previous?
		previous_node = self.class.where("id < ?", id).last

		if html == previous_node.try(:html)
			return {html: true, titles: true}
		elsif titles == previous_node.try(:titles)
			return {html: false, titles: true}
		else
			return {html: false, titles: false}
		end
	end

end
