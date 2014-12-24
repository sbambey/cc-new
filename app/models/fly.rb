class Fly < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	belongs_to :airline

	store_accessor :requirements, *FLIGHT_HOUR_TYPES.keys
	store_accessor :requirements, *RATINGS.keys
	store_accessor :requirements, *MEDICAL_INFORMATION.keys
	store_accessor :requirements, *ADDITIONAL.keys

	def self.permissible_params
		FLIGHT_HOUR_TYPES.keys
      .concat(RATINGS.keys)
      .concat(MEDICAL_INFORMATION.keys)
      .concat(ADDITIONAL.keys)
  end

end