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

class Fly < ActiveRecord::Base
	include Hstoreable
	extend FriendlyId

	friendly_id :name, use: [:slugged, :history]

	belongs_to :airline
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
	store_accessor :rating, *RATINGS.keys
	store_accessor :medical, *MEDICAL_INFORMATION.keys
	store_accessor :additional, *ADDITIONAL.keys

	def flight_time_requirements
		reqs = {}
		self.flight_time.each do |type, value|
			reqs[type] = value unless value == "0"
		end
		return self.class.order_according_to_hstore_keys(FLIGHT_HOUR_TYPES, reqs)
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
