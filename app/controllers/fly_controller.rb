class FlyController < ApplicationController
  before_action :redirect_unless_admin, only: [:create, :destroy, :show, :unstage]
  before_action :redirect_if_staging, only: [:show]

  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create

    #categories = fly_params["requirements"]["category"]
    #values = fly_params["requirements"]["value"]

  	#requirements_hash = {}

  	#categories.each_with_index do |item, index|
    #  key = FLIGHT_HOUR_TYPES.key(item)
  	#	requirements_hash[key] = values[index]
  	#end

  	#fly_params["requirements"] = requirements_hash

  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(fly_params)

  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(@fly.airline, @fly)
  	else
  		render "new"
  	end
  end

  def show
  end

  def index
  	@flies = Fly.all
  end

  def unstage
    @fly = Fly.friendly.find(params[:id])
    @to_destroy = Fly.where(["name = ? AND staged = ?", @fly.name, false]).first
    if @to_destroy
      @to_destroy.destroy
    end
    @fly.staged = false
    @fly.slug = nil
    @fly.save
    flash[:success] = "Opportunity unstaged successfully"

    redirect_to airline_fly_path(@fly.airline, @fly)
  end

  def destroy
    @fly = Fly.friendly.find(params[:id])
    @fly.destroy
    flash[:success] = "Opportunity deleted successfully"
    redirect_to root_path
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :equipment, :base, :expiration, :website, :intro, :content, :airline_id, *User.permissible_params)
  	end

    def redirect_if_staging
      @fly = Fly.friendly.find(params[:id])
      if @fly.staged && !current_user.try(:admin?)
        redirect_to root_path
      end
    end
end
