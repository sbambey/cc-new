require 'rails_helper'

RSpec.describe AirlinesController, :type => :controller do

	context "when unauthenticated" do
		let(:airline) { FactoryGirl.create(:airline) }

		#it "lets user interact with index" do
		#	get :index
		#	expect(response).to render_template :index
		#end

		it "lets user interact with show" do
			get :show, id: airline.id
			expect(response).to render_template :show
		end

		it "does not let user interact with new" do
			get :new
			expect(response).to redirect_to(new_user_session_path)
			expect(flash[:alert]).to be_present
		end

		it "does not let user interact with create" do
			post :create
			expect(response).to redirect_to(new_user_session_path)
			expect(flash[:alert]).to be_present
		end
	end

=begin
	describe "GET #index" do
		let(:airline) { FactoryGirl.create(:airline) }

		context "when unauthenticated" do
			login_user

			it "assigns Airline(s) to @airlines" do
				get :index
				expect(assigns(:airlines)).to eq([airline])
			end
		end
	end
=end
	describe "GET #show" do
		let(:airline) { FactoryGirl.create(:airline) }

		context "when unauthenticated" do
			login_user

			it "assigns an Airline to @airline" do
				get :show, id: airline
				expect(assigns(:airline)).to eq(airline)
			end
		end
	end

	describe "GET #new" do
		context "when an admin" do
			login_admin

			it "assigns a new Airline to @airline" do
				get :new
				expect(assigns(:airline)).to be_a_new(Airline)
			end

			it "renders the new view" do
				get :new
				expect(response).to render_template :new
			end
		end
	end

	describe "POST #create" do
		let(:airline) { FactoryGirl.build(:airline) }

		context "when an admin" do
			login_admin

			let(:airline_params) { FactoryGirl.attributes_for(:airline) }

			it "does not create an airline given improper params" do
				expect {
					post :create, airline: {unpermitted: "invalid"}
				}.to raise_error(ActionController::UnpermittedParameters)
			end

			it "creates an airline given proper params and redirects to #show with flash" do
				post :create, airline: airline_params

				expect(assigns(:airline)).to_not be_new_record
				expect(flash[:success]).to be_present
				expect(response).to redirect_to(assigns(:airline))
			end
		end
	end
end