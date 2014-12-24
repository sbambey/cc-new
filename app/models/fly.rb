class Fly < ActiveRecord::Base
	include Hstoreable
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	belongs_to :airline

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
	store_accessor :rating, *RATINGS.keys
	store_accessor :medical, *MEDICAL_INFORMATION.keys
	store_accessor :additional, *ADDITIONAL.keys

	def self.permissible_params
		FLIGHT_HOUR_TYPES.keys
      .concat(RATINGS.keys)
      .concat(MEDICAL_INFORMATION.keys)
      .concat(ADDITIONAL.keys)
  end

end