require 'rails_helper'

RSpec.describe "airlines/show", :type => :view do

	let(:airline) { FactoryGirl.create(:airline) }
	let(:fly) { FactoryGirl.create(:fly, airline: airline) }

  it "displays all its flies" do
  	assign(:airline, fly.airline)

  	render

  	expect(rendered).to have_content(airline.name)
  	expect(rendered).to have_content(fly.name)
  end
end
