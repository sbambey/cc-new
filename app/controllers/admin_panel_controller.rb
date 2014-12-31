class AdminPanelController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin

	def home
		@node_sets = ScrapeNodeSet.all.order(id: :desc).limit(30)
		#@admin_notices = AdminNotice.all.order(id: :desc).limit(30)
	end
	
end
