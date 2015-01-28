class ScrapeNodeSetController < ApplicationController
	before_action :authenticate_user!, :redirect_unless_admin
	
  def create
  end

  def destroy
  end
end
