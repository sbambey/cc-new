class Airline < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :history]

	has_many :flies

	has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true

	def has_active_recruitment?
		self.flies.present?
	end
end
