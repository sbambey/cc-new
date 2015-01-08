class AirlinesController < ApplicationController
  before_action :authenticate_user!, :redirect_unless_admin, except: [:index, :show]

  def index
  	@airlines = Airline.all
  end

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

  private

  	def airline_params
  		params.require(:airline).permit(:name, :country, :recruitment_overview_page, :content_selector, :title_selector, :no_track, :logo)
  	end
end
