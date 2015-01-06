class MainController < ApplicationController
  def index
  	@airlines = Airline.all.order("id desc").limit(10)
  end
end
