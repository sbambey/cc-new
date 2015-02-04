class MainController < ApplicationController
  before_action :authenticate_user!

  def index
  	@flies = find_matched_flies.paginate(page: params[:page], per_page: 15)
  end

  def opportunities
   @flies = Fly.joins(:airline).order("airlines.name").paginate(page: params[:page], per_page: 20)
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
