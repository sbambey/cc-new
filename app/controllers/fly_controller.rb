class FlyController < ApplicationController
  #before_action :authenticate_user!, except: [:show]
  #before_action :redirect_unless_admin, except: [:show]
  before_action :authenticate_user!
  before_action :redirect_unless_admin

  def show
    @fly = Fly.friendly.find(params[:id])
  end

  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create
  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(fly_params)

  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		#redirect_to airline_fly_path(@fly.airline, @fly)
      redirect_to root_path
  	else
  		render "new"
  	end
  end

  def edit
    @airline = Airline.friendly.find(params[:airline_id])
    @fly = Fly.friendly.find(params[:id])
  end

  def update

    @airline = Airline.friendly.find(params[:airline_id])
    @fly = @airline.flies.friendly.find(params[:id])

    if @fly.update_attributes(fly_params)
      flash[:success] = "Updated opportunity successfully"
      #redirect_to airline_fly_path(@airline, @fly)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

	def fly_params
		params.require(:fly).permit(:name, :posting_website, :posting_date_as_string, :posting_date_as_date, :content_selector, :no_track, :airline_id, :deleted_at, :content, :job_type, :ongoing, :location)
  end
end
