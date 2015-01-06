require 'rails_helper'

RSpec.describe FlyController, :type => :controller do

	context "when not an admin" do
		login_user

		let(:fly) { FactoryGirl.create(:fly) }

		#it "lets user interact with index" do
		#	get :index
		#	expect(response).to render_template("index")
		#end

		it "lets user interact with show" do
			get :show, id: fly.id, airline_id: fly.airline.id
			expect(response).to render_template("show")
		end

		it "does not let user interact with new and shows no flash" do
			get :new, airline_id: fly.airline.id
			expect(response).to redirect_to(root_path)
			expect(flash).to be_empty
		end

		it "does not let user interact with create and shows no flash" do
			post :create, airline_id: fly.airline.id
			expect(response).to redirect_to(root_path)
			expect(flash).to be_empty
		end
	end

	describe "POST #create" do
		let(:fly) { FactoryGirl.build(:fly) }

		context "when an admin" do
			login_admin

			let(:fly_params) { FactoryGirl.attributes_for(:fly) }

			it "does not create an opportunity given improper params" do
				expect {
					post :create, airline_id: fly.airline.id, fly: {unpermitted: "invalid"}
				}.to raise_error(ActionController::UnpermittedParameters)
			end

			it "creates an opportunity given proper params and redirects to #show with flash" do
				post :create, airline_id: fly.airline.id, fly: fly_params

				expect(assigns(:fly)).to_not be_new_record
				expect(flash[:success]).to_not be_nil
				expect(response).to redirect_to(assigns(:fly))
			end
		end
	end
end