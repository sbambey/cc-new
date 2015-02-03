class AdminPanelController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin

	def home
		#@node_sets = ScrapeNodeSet.all.order(id: :desc).limit(90)
		@node_sets = ScrapeNodeSet.where("created_at >= ?", ScrapeNodeSet.where(airline_id: 2).last.created_at)
		#@admin_notices = AdminNotice.all.order(id: :desc).limit(30)
	end

	def progress
		@flies = Fly.where("updated = false")
	end

	def untracked
		@airlines = Airline.where("no_track = true").where("recruitment_overview_page IS NULL")
	end

	def user_management
		@users = User.all.order(created_at: :desc)
	end
	
end
