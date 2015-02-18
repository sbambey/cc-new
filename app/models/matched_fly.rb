class MatchedFly < ActiveRecord::Base
	belongs_to :user
	
	serialize :matched, Array
end
