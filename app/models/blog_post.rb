class BlogPost < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

	belongs_to :user
end
