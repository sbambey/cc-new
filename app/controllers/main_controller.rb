class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  	if user_signed_in?
  		@flies = find_matched_flies
  	else
  		@airlines = Airline.all
  	end
  end

  def opportunities
    @airlines = Airline.all.order(:name => :asc)
  end

  private
  
  	def find_matched_flies
  		FlyMatchingService.new({
  			flight_time: current_user.flight_time,
        medical_license: current_user.medical_license,
        rating: current_user.rating,
        flight_experience: current_user.flight_experience
  		}).flies
  	end
end
