class TypeRatingsStaticController < ApplicationController
	before_action :authenticate_user!
	before_action :redirect_unless_admin, except: [:index]

	def index
		@ratings = TypeRatingStatic.order(:designation).where("designation LIKE ?", "%#{params[:term]}%")
		render json: @ratings.map(&:designation)
	end
end
