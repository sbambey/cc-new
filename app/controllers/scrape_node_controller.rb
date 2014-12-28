class ScrapeNodeController < ApplicationController
  def create
  	@current_node = ScrapeNode.new(scrape_node_params)
  	@current_node.save
  end

  def destroy
  end

  private

  	def scrape_node_params
  		params.require(:scrape_node).permit(:html, :fly_count, :titles => [], :airline_id)
  	end
end
