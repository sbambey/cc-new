class AdminNoticeController < ApplicationController
  def create
  	@notice = AdminNotice.new(admin_notice_params)
  	@notice.save
  end

  def destroy
  end

  private

  	def admin_notice_params
  		params.require(:admin_notice).permit(:airline_id, :listable_id, :scrape_node_id)
  	end
end
