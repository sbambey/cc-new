class FlyController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_unless_admin, except: [:index, :show]
  before_filter :type_ratings_static, only: [:new, :edit]

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

  def edit
    @airline = Airline.friendly.find(params[:airline_id])
    @fly = Fly.friendly.find(params[:id])
  end

  def update

    @airline = Airline.friendly.find(params[:airline_id])
    @fly = @airline.flies.friendly.find(params[:id])

    to_update = fly_params

    to_update[:updated] = true

    to_update[:added_requirements] = [] if to_update[:added_requirements].nil?

    if @fly.update_attributes(to_update)
      flash[:success] = "Updated opportunity successfully"
      redirect_to airline_fly_path(@airline, @fly)
    else
      render "edit"
    end
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :website, :equipment, :base, :website, :rating, :medical_license, :posting_expiry_as_string, :posting_expiry_as_date, :posting_date_as_string, :posting_date_as_date, :content_selector, :no_track, :no_match, :airline_id, *Fly.permissible_params, :general_recruitment, :type_ratings, {:added_requirements => []}, {type_ratings_attributes: [:id, :designation, :issuance, :current, :_destroy]})
    end
end
