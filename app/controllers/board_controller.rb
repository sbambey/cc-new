class BoardController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:matched]
  before_action :authenticate_user!, except: [:all]
  
  def matched
    @jobs = find_matched_flies.active.search(params[:search]).order("created_at DESC").paginate(per_page: 10, page: params[:page])
    #@flies = Fly.joins(:airline).order("created_at DESC").paginate(page: params[:page], per_page: 20)
    #@flies = Fly.joins(:airline).order("created_at DESC").paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
    end
  end

  def all
    @jobs = Fly.search(params[:search]).order("created_at DESC").paginate(per_page: 10, page: params[:page])
    @job_count = Fly.all.count
    @airline_count = Airline.all.count
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
    end
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

  def redirect_if_not_signed_in
    if !user_signed_in?
      redirect_to jobs_path
    end
  end
end
