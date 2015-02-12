class StaticPagesController < ApplicationController
	before_action :redirect_if_signed_in, only: [:landing]

	def landing
    @jobs = Fly.search(params[:search]).order("created_at DESC").paginate(per_page: 10, page: params[:page])
    @job_count = Fly.all.count
    @airline_count = Airline.all.count
    respond_to do |format|
      format.js { render "shared/jobs.js.erb" }
      format.html
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
