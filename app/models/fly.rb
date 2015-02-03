class Fly < ActiveRecord::Base
	include Hstoreable
	extend FriendlyId

	friendly_id :slug_candidates, use: [:slugged, :history]

	belongs_to :airline
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy

	#default_scope { where("removed = ?", false) }

	serialize :added_requirements, Array

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
	store_accessor :flight_experience, *FLIGHT_EXPERIENCE.keys

	#validates :rating, inclusion: [*RATINGS.values, ""]
  #validates :medical_license, inclusion: [*MEDICAL_LICENSES.values, ""]

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

	def self.permissible_params
		FLIGHT_HOUR_TYPES.keys.concat(FLIGHT_EXPERIENCE.keys)
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  def slug_candidates
  	[
  		:name,
  		[:name, :airline_id]
  	]
  end
end
