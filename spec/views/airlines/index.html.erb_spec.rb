require 'rails_helper'

RSpec.describe "airlines/index", :type => :view do

	let(:airlines) { [FactoryGirl.create(:airline)] }

  it "displays all airlines" do
  	assign(:airlines, [airlines])

  	render

  	expect(rendered).to have_content(airlines.first.name)
  	expect(rendered).to have_selector("tr", count: airlines.length+1)
  end
end
