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
	

end
