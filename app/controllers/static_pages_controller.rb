class StaticPagesController < ApplicationController
	before_action :redirect_if_signed_in, only: [:landing]

	def landing
		@flies = Fly.all.order("id desc").limit(5)
    @airlines_count = Airline.count
    @flies_count = Fly.count
    @airline_images = []
    airlines = %w(envoy-air spirit-airlines expressjet commutair island-air mesa-airlines american-airlines allegiant-air empire-airlines delta-air-lines horizon-air)
    airlines.each do |a|
      @airline_images << Airline.friendly.find(a).logo
    end
	end

  def contact
  end

  def mission
  end

  def blog
  end

  private

  	def redirect_if_signed_in
  		if user_signed_in?
  			redirect_to board_path
  		end
  	end

end
