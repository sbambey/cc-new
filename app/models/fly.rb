class Fly < ActiveRecord::Base
	include Hstoreable
	extend FriendlyId

	friendly_id :name, use: [:slugged, :history]

	belongs_to :airline
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy

	serialize :added_requirements, Array

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
	store_accessor :rating, *RATINGS.keys
	store_accessor :medical, *MEDICAL_INFORMATION.keys
	store_accessor :additional, *ADDITIONAL.keys

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

	def rating_requirements
		requirements_by_type(:rating, RATINGS)
	end

	def medical_requirements
		requirements_by_type(:medical, MEDICAL_INFORMATION)
	end

	def additional_requirements
		requirements_by_type(:additional, ADDITIONAL)
	end

	def self.matching_conditions_met(user)
		Fly.where("#{user.total_time.to_i} >= (flight_time -> 'total_time')::int")
	end

	def self.permissible_params
		FLIGHT_HOUR_TYPES.keys
      .concat(RATINGS.keys)
      .concat(MEDICAL_INFORMATION.keys)
      .concat(ADDITIONAL.keys)
  end



end
