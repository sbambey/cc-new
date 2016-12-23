class Airline < ActiveRecord::Base
	extend FriendlyId

	friendly_id :name, use: [:slugged, :history]

	has_many :flies
	has_many :notices, class_name: "AdminNotice", as: :listable, dependent: :destroy
	has_many :node_sets, class_name: "ScrapeNodeSet", dependent: :destroy
	has_many :nodes, class_name: "ScrapeNode", as: :scrapeable, dependent: :destroy

	has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true

  scope :untracked, -> { where(no_track: false) }

	def should_generate_new_friendly_id?
    name_changed?
  end

  def has_active_recruitment?
    #TODO
  end
end
