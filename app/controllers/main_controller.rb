class MainController < ApplicationController
  def index
  	@flies = Fly.matching_conditions_met(current_user) if user_signed_in?
  end
end
