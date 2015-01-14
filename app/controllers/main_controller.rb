class MainController < ApplicationController
  def index
  	@airlines = Airline.all.order("id asc")
  end
end
