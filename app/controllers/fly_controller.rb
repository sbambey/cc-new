class FlyController < ApplicationController
  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create

  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(fly_params)

  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(@fly.airline, @fly)
  	else
  		render 'new'
  	end
  end

  def show
  	@fly = Fly.friendly.find(params[:id])
  end

  def index
  	@flies = Fly.all
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :expiration, :website, :airline_id)
  	end
end
