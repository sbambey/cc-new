require 'rails_helper'

RSpec.describe "fly/show", :type => :view do

	let(:airline) { FactoryGirl.create(:airline) }
	let(:fly) { FactoryGirl.create(:fly, airline: airline) }

  it "displays the opportunity name" do
  	assign(:fly, fly)

  	render

  	expect(rendered).to have_content(fly.name)
  end
end
