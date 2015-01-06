class FlyController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_unless_admin, except: [:show]

  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create

    #categories = fly_params["requirements"]["category"]
    #values = fly_params["requirements"]["value"]

  	#requirements_hash = {}

  	#categories.each_with_index do |item, index|
    #  key = FLIGHT_HOUR_TYPES.key(item)
  	#	requirements_hash[key] = values[index]
  	#end

  	#fly_params["requirements"] = requirements_hash

  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(fly_params)

  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(@fly.airline, @fly)
  	else
  		render "new"
  	end
  end

  def show
    @fly = Fly.friendly.find(params[:id])
  end

  def index
  	@flies = Fly.all
  end

  def destroy
    @fly = Fly.friendly.find(params[:id])
    @fly.destroy
    flash[:success] = "Opportunity deleted successfully!"
    redirect_to root_path
  end

  # == Schema Information
#
# Table name: flies
#
#  id                       :integer          not null, primary key
#  name                     :string
#  position                 :string
#  website                  :string
#  equipment                :string
#  base                     :string
#  intro                    :text
#  content                  :text
#  flight_time              :hstore
#  rating                   :hstore
#  medical                  :hstore
#  additional               :hstore
#  posting_date_as_string   :string
#  posting_expiry_as_string :string
#  posting_date_as_date     :date
#  posting_expiry_as_date   :date
#  content_selector         :text
#  untracked                :boolean
#  airline_id               :integer
#  slug                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :website, :equipment, :base, :website, :intro, :content, :posting_expiry_as_string, :content_selector, :untracked, :airline_id, *Fly.permissible_params)
  	end
end
