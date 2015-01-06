require 'rails_helper'

RSpec.describe AirlinesController, :type => :controller do

	context "when not an admin" do
		login_user

		let(:airline) { FactoryGirl.create(:airline) }

		it "lets user interact with index" do
			get :index
			expect(response).to render_template("index")
		end

		it "lets user interact with show" do
			get :show, id: airline.id
			expect(response).to render_template("show")
		end

		it "does not let user interact with new and shows no flash" do
			get :new
			expect(response).to redirect_to(root_path)
			expect(flash).to be_empty
		end

		it "does not let user interact with create and shows no flash" do
			post :create
			expect(response).to redirect_to(root_path)
			expect(flash).to be_empty
		end
	end

	describe "POST #create" do
		let(:airline) { FactoryGirl.build(:airline) }

		context "when an admin" do
			login_admin

			let(:airline_params) { FactoryGirl.attributes_for(:airline) }

			#it "creates an airline given proper params" do
			#	expect {
			#		post :create, airline: airline_params
			#	}.to change(Airline, :count).by(1)
			#end

			it "does not create an airline given improper params" do
				expect {
					post :create, airline: {unpermitted: "invalid"}
				}.to raise_error(ActionController::UnpermittedParameters)
			end

			it "creates an airline given proper params and redirects to #show with flash" do
				post :create, airline: airline_params

				expect(assigns(:airline)).to_not be_new_record
				expect(flash[:success]).to_not be_nil
				expect(response).to redirect_to(assigns(:airline))
			end
		end
	end
end