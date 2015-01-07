# == Schema Information
#
# Table name: airlines
#
#  id                        :integer          not null, primary key
#  name                      :string
#  country                   :string
#  recruitment_overview_page :text
#  content_selector          :text
#  title_selector            :text
#  untracked                 :boolean
#  slug                      :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  logo_file_name            :string
#  logo_content_type         :string
#  logo_file_size            :integer
#  logo_updated_at           :datetime
#

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

  scope :untracked, -> { where(no_track: false) }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true

	def has_active_recruitment?
		self.flies.where("no_match = ?", false).any?
	end
end
