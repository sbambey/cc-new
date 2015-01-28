class ScrapeNodeController < ApplicationController
  before_action :authenticate_user!, :redirect_unless_admin
  
  def create
  	@current_node = ScrapeNode.new(scrape_node_params)
  	@current_node.save
  end

  def destroy
  end

  private

  	def scrape_node_params
  		params.require(:scrape_node).permit(:node_type, :html, :scrapeable_id, :scrapeable_type, :scrape_node_set_id, :titles => [])
  	end
end
