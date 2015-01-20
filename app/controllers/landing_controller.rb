class LandingController < ApplicationController
	before_action :redirect_if_signed_in, only: [:show]

  def show
  	@flies = Fly.all.order("id desc").limit(5)
  end

  private

  	def redirect_if_signed_in
  		if user_signed_in?
  			redirect_to main_index_path
  		end
  	end

end
