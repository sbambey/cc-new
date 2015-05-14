class Fly < ActiveRecord::Base
	include Hstoreable
	include Searchable
	extend FriendlyId

	friendly_id :slug_candidates, use: [:slugged, :history]

	belongs_to :airline
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy
	has_many :fly_user_type_ratings
	has_many :type_ratings, through: :fly_user_type_ratings, dependent: :destroy

	accepts_nested_attributes_for :fly_user_type_ratings, allow_destroy: true

	default_scope { where("deleted_at IS NULL") }
	scope :deleted, -> { unscoped.where("deleted_at IS NOT NULL") }
	scope :active, -> { where(general_recruitment: false) }
	scope :inactive, -> { where(general_recruitment: true) }

	serialize :added_requirements, Array

	before_save :set_names
	before_save :set_medical

	store_accessor :flight_time, *FLIGHT_HOUR_TYPES.keys
	store_accessor :flight_experience, *FLIGHT_EXPERIENCE.keys

	#validates :operation, inclusion: [*OPERATIONS.values]
	#validates :position, inclusion: [*POSITIONS.values]
	validates :rating, inclusion: [*RATINGS.values, ""]
  validates :medical_license, inclusion: [*MEDICAL_LICENSES.values, ""]

	def ordered_requirements_by_type(type, constant)
		reqs = {}
		self.send(type).each do |type, value|
			reqs[type] = value unless value == "0"
		end 
		return self.class.order_according_to_hstore_keys(constant, reqs)
	end

	def flight_time_requirements
		ordered_requirements_by_type(:flight_time, FLIGHT_HOUR_TYPES)
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

  private

  def set_names
  	self.short_name = "#{(self.equipment) if self.equipment.present?} #{self.position}"
  	self.name = "#{self.short_name}#{(" in " + self.base) if self.base.present?}"
  end

  def set_medical
  	if self.operation == "Part 121"
  		self.medical_license = "Class 1"
  	else
  		self.medical_license = "Class 2"
  	end
  end
end
