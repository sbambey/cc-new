class Fly < ActiveRecord::Base
	include Hstoreable
	extend FriendlyId

	friendly_id :name, use: [:slugged, :history]

	belongs_to :airline
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy

	serialize :added_requirements, Array

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys

	validates :rating, inclusion: [*RATINGS.values, ""]
  validates :medical_license, inclusion: [*MEDICAL_LICENSES.values, ""]

	def requirements_by_type(type, constant)
		reqs = {}
		self.send(type).each do |type, value|
			reqs[type] = value unless value == "0"
		end 
		return self.class.order_according_to_hstore_keys(constant, reqs)
	end

	def flight_time_requirements
		requirements_by_type(:flight_time, FLIGHT_HOUR_TYPES)
	end

	def self.matching_conditions_met(user)
		Fly.where("#{user.total_time.to_i} >= (flight_time -> 'total_time')::int")
	end

	def self.permissible_params
		FLIGHT_HOUR_TYPES.keys
  end

end
