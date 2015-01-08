require 'rails_helper'

RSpec.describe FlyController, :type => :controller do

	context "when unauthenticated" do
		let(:fly) { FactoryGirl.create(:fly) }

		it "lets user interact with show" do
			get :show, id: fly, airline_id: fly.airline
			expect(response).to render_template :show
		end

		it "does not let user interact with new and shows no flash" do
			get :new, airline_id: fly.airline
			expect(response).to redirect_to(new_user_session_path)
			expect(flash[:alert]).to be_present
		end

		it "does not let user interact with create and shows no flash" do
			post :create, airline_id: fly.airline
			expect(response).to redirect_to(new_user_session_path)
			expect(flash[:alert]).to be_present
		end
	end

	describe "GET #show" do
		let(:fly) { FactoryGirl.create(:fly) }

		context "when unauthenticated" do
			it "assigns a Fly to @fly" do
				get :show, id: fly, airline_id: fly.airline
				expect(assigns(:fly)).to eq(fly)
			end
		end
	end

	describe "GET #new" do
		let(:airline) { FactoryGirl.create(:airline) }

		context "when an admin" do
			login_admin

			it "assigns a new Fly to @fly" do
				get :new, airline_id: airline
				expect(assigns(:fly)).to be_a_new(Fly)
			end

			it "renders the new view" do
				get :new, airline_id: airline
				expect(response).to render_template :new
			end
		end
	end

	describe "POST #create" do
		let(:fly) { FactoryGirl.build(:fly) }

		context "when an admin" do
			login_admin

			let(:fly_params) { merge_in_hstore(FactoryGirl.attributes_for(:fly)) }

			it "does not create a fly given improper params" do
				expect {
					post :create, airline_id: fly.airline.id, fly: {unpermitted: "invalid"}
				}.to raise_error(ActionController::UnpermittedParameters)
			end

			it "creates a fly given proper params and redirects to #show with flash" do
				post :create, airline_id: fly.airline.id, fly: fly_params

				expect(assigns(:fly)).to_not be_new_record
				expect(flash[:success]).to_not be_nil
				expect(response).to redirect_to(airline_fly_path(fly.airline, assigns(:fly)))
			end
		end
	end
end