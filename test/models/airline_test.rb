require 'test_helper'

class AirlineTest < ActiveSupport::TestCase

	def setup
		@airline = Airline.new(name: "Example Airline")
	end

	test "should be valid" do
		assert @airline.valid?
	end

	test "name should be present" do
		@airline.name = "   "
		assert_not @airline.valid?
	end

end
