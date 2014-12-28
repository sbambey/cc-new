class AdminPanelController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin

	def home
		@admin_notices = AdminNotice.all.order(id: :desc).limit(30)
	end
	
end
