class FlyController < ApplicationController
  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create

  	to_submit = fly_params

  	requirements = to_submit['requirements']

  	requirements_hash = {}

  	requirements['category'].each_with_index do |item, index|
  		requirements_hash[item] = requirements['specifics'][index]
  	end

  	to_submit['requirements'] = requirements_hash

  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(to_submit)

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
  		params.require(:fly).permit(:name, :position, :equipment, :base, :expiration, :website, :intro, :content, :airline_id, :requirements => [:category => [], :specifics => []])
  	end
end
