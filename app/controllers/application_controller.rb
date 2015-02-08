class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def type_ratings_static
  	@type_ratings_static = []
  	TypeRatingStatic.all.each do |r|
  		@type_ratings_static << r.designation
  	end
  end

  private

  	def redirect_unless_admin
			unless current_user.try(:admin?)
				redirect_to root_path
			end
		end
end
