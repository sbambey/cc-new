class BoardController < ApplicationController
  before_action :authenticate_user!

  def all
   @flies = Fly.joins(:airline).order("airlines.name").paginate(page: params[:page], per_page: 20)
  end

  def active
  	@flies = find_matched_flies.active.paginate(page: params[:page], per_page: 15)
  end

  def general_recruitment
    @flies = find_matched_flies.inactive.paginate(page: params[:page], per_page: 15)
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
