require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
	describe "POST #order" do
		let(:customer) { FactoryBot.create(:customer) }
		let(:teached_lesson) { FactoryBot.create(:teachedlesson) }

		context "logged in" do
	      before(:each) do
	        request.headers['Authorization'] =
	          "Bearer " + TokenService.issue(customer.member.id)

	        post :create, params: {teached_lesson_id: teached_lesson.id}
	      end

		  it "returns HTTP 200 OK" do
	        expect(response).to have_http_status(:ok)
	      end
		end

		

	end
	
	describe "GET order#show" do
		let(:order) { FactoryBot.create(:order) }

		before(:each) do
			get :show, params: {id: order.id }
		end

		it "returns HTTP 200 OK" do
			expect(response).to have_http_status(:ok)
		end

		describe "JSON response body" do
			let(:json) { JSON.parse(response.body, symbolize_names: true) }

			it "has same ID" do
				expect(json[:id]).to eq(order.id)
			end
		end

	end

end
