class AirlinesController < ApplicationController
  def index
  	@airlines = Airline.all
  end

  def new
  	@airline = Airline.new
  end

  def create
  	@airline = Airline.new(airline_params)

  	if @airline.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def show
    @airline = Airline.friendly.find(params[:id])
  end


  private

  	def airline_params
  		params.require(:airline).permit(:logo, :name)
  	end
end
