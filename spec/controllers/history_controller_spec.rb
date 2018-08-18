require 'rails_helper'

RSpec.describe HistoryController, type: :controller do
    describe "GET history#index" do
        let(:customer_with_orders) { FactoryBot.create(:customer_with_orders) }
        let(:tutor_with_orders) { FactoryBot.create(:tutor_with_orders) }

        context "logged in as customer" do
            before(:each) do
                request.headers['Authorization'] =
                    "Bearer " + TokenService.issue(customer_with_orders.member.id)
        
                get :show
            end

            it "returns HTTP 200 OK" do
                expect(response).to have_http_status(:ok)
            end

            describe "JSON response body" do
                let(:json) { JSON.parse(response.body, symbolize_names: true) }
                
                it "returns order with same customer_id" do
                    expect(json.all?{|h| h[:customer_id] == customer_with_orders.id })
                end
            end
        end

        context "logged in as tutor" do
            before(:each) do
                request.headers['Authorization'] =
                    "Bearer " + TokenService.issue(tutor_with_orders.member.id)
        
                get :show
            end

            it "returns HTTP 200 OK" do
                expect(response).to have_http_status(:ok)
            end

            describe "JSON response body" do
                let(:json) { JSON.parse(response.body, symbolize_names: true) }
                
                it "returns order with same tutor_id" do
                    expect( json.all?{ |h| h[:tutor_id] == tutor_with_orders.id })
                end
            end

        end

    end
end
