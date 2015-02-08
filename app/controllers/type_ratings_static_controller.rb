class TypeRatingsStaticController < ApplicationController
	def index
		@ratings = TypeRatingStatic.order(:designation).where("designation LIKE ?", "%#{params[:term]}%")
		render json: @ratings.map(&:designation)
	end
end
