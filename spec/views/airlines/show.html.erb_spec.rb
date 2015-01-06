require 'rails_helper'

RSpec.describe "airlines/show", :type => :view do

	let(:airline) { FactoryGirl.create(:airline) }
	let(:fly) { FactoryGirl.create(:fly, airline: airline) }

  it "displays all its flies" do
  	assign(:airline, fly.airline)

  	render

  	expect(rendered).to match /#{fly.name}/
  end
end
