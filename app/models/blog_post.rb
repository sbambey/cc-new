class BlogPost < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

	belongs_to :user

	def should_generate_new_friendly_id?
    title_changed?
  end
end
