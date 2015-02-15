class BoardController < ApplicationController
  before_action :authenticate_user!, except: [:all]
  before_action :redirect_if_not_signed_in, except: [:all]
  
  def matched
    @jobs = find_matched_flies.active.includes(:airline, :type_ratings).search(params[:search]).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
    end
  end

  def all
    @jobs = Fly.includes(:airline, :type_ratings).search(params[:search]).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
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
      flight_experience: current_user.flight_experience,
      type_ratings: current_user.type_ratings
		}).flies
	end

  def redirect_if_not_signed_in
    if !user_signed_in?
      redirect_to jobs_path
    end
  end
end
