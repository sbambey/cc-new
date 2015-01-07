class MainController < ApplicationController
  def index
  	@airlines = Airline.all.order("id desc")
  end
end
