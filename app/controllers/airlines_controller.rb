class AirlinesController < ApplicationController
  #before_action :authenticate_user!, except: [:show]
  #before_action :redirect_unless_admin, except: [:show]
  before_action :authenticate_user!
  before_action :redirect_unless_admin

  def show
    @airline = Airline.friendly.find(params[:id])
  end

  def new
  	@airline = Airline.new
  end

  def create
  	@airline = Airline.new(airline_params)

  	if @airline.save
      flash[:success] = "Created airline successfully!"
  		redirect_to airline_path(@airline)
  	else
  		render "new"
  	end
  end

  def edit
    @airline = Airline.friendly.find(params[:id])
  end

  def update
    @airline = Airline.friendly.find(params[:id])

    if @airline.update_attributes(airline_params)
      flash[:success] = "Updated airline successfully"
      redirect_to airline_path(@airline)
    else
      render "edit"
    end
  end

  private

  	def airline_params
  		params.require(:airline).permit(:name, :country, :recruitment_overview_page, :content_selector, :title_selector, :no_track, :logo)
  	end
end
