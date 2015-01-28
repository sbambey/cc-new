class AdminPanelController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin

	def home
		@node_sets = ScrapeNodeSet.all.order(id: :desc).limit(90)
		#@admin_notices = AdminNotice.all.order(id: :desc).limit(30)
	end

	def progress
		@flies = Fly.where("updated = false")
	end

	def untracked
		@airlines = Airline.where("no_track = true").where("recruitment_overview_page IS NULL")
	end

	def user_management
		@users = User.all
	end
	
end
