class AdminPanelController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin

	def home
		#@node_sets = ScrapeNodeSet.all.order(id: :desc).limit(Airline.all.count-Airline.untracked.count)
		alphabetically_first_airline = nil
		Airline.order("name ASC").each do |a|
			if a.created_at.present? then
				alphabetically_first_airline = a
				break
			end
		end
		@node_sets = ScrapeNodeSet.where("created_at >= ?", ScrapeNodeSet.where(airline_id: alphabetically_first_airline.id).last.created_at)
		#@admin_notices = AdminNotice.all.order(id: :desc).limit(30)
	end

	def progress
		@airlines = Airline.order('name ASC')
	end

	def untracked
		@airlines = Airline.where("no_track = true").where("recruitment_overview_page IS NULL")
	end

	def user_management
		@users = User.all.order(created_at: :desc)
	end
	
end
