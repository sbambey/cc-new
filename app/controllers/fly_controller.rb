class FlyController < ApplicationController
  before_action :authenticate_user!, :redirect_unless_admin, except: [:show]

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
  		redirect_to airline_fly_path(@fly.airline, @fly)
  	else
  		render "new"
  	end
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :website, :equipment, :base, :website, :rating, :medical_license, :posting_expiry_as_string, :posting_expiry_as_date, :posting_date_as_string, :posting_date_as_date, :content_selector, :no_track, :no_match, :airline_id, *Fly.permissible_params, :added_requirements => [])
  	end
end
