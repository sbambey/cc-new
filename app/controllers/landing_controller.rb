class LandingController < ApplicationController
	before_action :redirect_if_signed_in, only: [:show]

  def show
  	@flies = Fly.all.order("id desc").limit(5)
    @airlines_count = Airline.count
    @flies_count = Fly.count
    @airline_images = []
    airlines = %w(envoy-air spirit-airlines expressjet commutair island-air mesa-airlines american-airlines allegiant-air empire-airlines delta-air-lines horizon-air)
    airlines.each do |a|
      @airline_images << Airline.friendly.find(a).logo
    end
  end

  private

  	def redirect_if_signed_in
  		if user_signed_in?
  			redirect_to main_index_path
  		end
  	end

end