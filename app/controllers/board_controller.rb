class BoardController < ApplicationController
  before_action :authenticate_user!, except: [:all]
  before_action :redirect_if_not_signed_in, except: [:all]
  
  def matched
    @jobs = Fly.active.includes(:airline).search(params[:search]).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
    end
  end

  def all
    @jobs = Fly.includes(:airline).search(params[:search]).order(created_at: :desc).paginate(per_page: 10, page: params[:page])
    @job_count = Fly.all.count
    @airline_count = Airline.all.count
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
    end
  end

  def general_recruitment
    @flies = Fly.all
  end
  
  private

  def redirect_if_not_signed_in
    if !user_signed_in?
      redirect_to jobs_path
    end
  end
end
