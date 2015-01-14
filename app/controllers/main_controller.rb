class MainController < ApplicationController
  def index
  	if user_signed_in?
  		@flies = find_matched_flies
  	else
  		@airlines = Airline.all
  	end
  end

  private
  	def find_matched_flies
  		FlyMatchingService.new({
  			flight_time: current_user.flight_time
  		}).flies
  	end
end
