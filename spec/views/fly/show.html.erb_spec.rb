require 'rails_helper'

RSpec.describe "fly/show", :type => :view do

	context "given a fly with requirements" do
		let(:airline) { FactoryGirl.create(:airline) }
		let(:fly) { FactoryGirl.create(:fly, airline: airline) }

	  it "displays the requirements" do
	  	assign(:fly, fly)

	  	render

	  	expect(rendered).to have_content("Flight Time")
	  	expect(rendered).to have_content(fly.total_time)

	  	expect(rendered).to have_content("Medical Requirements")
	  	expect(rendered).to have_content(fly.medical_license)

	  	expect(rendered).to have_content("Additional Requirements")
	  	expect(rendered).to have_content(fly.work_right)
	  end
	end

	context "given a fly without requirements" do
		let(:airline) { FactoryGirl.create(:airline) }
		let(:fly) { FactoryGirl.create(:fly_without_requirements, airline: airline) }

		it "does not display any requirements or their headings" do
			assign(:fly, fly)

			render

			expect(rendered).to_not have_content("Flight Time")
	  	expect(rendered).to_not have_content("Medical Requirements")
	  	expect(rendered).to_not have_content("Additional Requirements")
	  end
	end
end
