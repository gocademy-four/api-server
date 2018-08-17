require 'rails_helper'

RSpec.describe ClassesController, type: :controller do
    describe "GET class#show" do

        context "without category_id and lesson_id as parameter" do
            let(:teachedlesson) { FactoryBot.create(:teachedlesson) }

            before(:each) do
                get :show, params: { id: teachedlesson.id }
            end

            it "returns HTTP 200 OK" do
                expect(response).to have_http_status(:ok)
            end
    
            describe "JSON response body" do
                let(:json) { JSON.parse(response.body, symbolize_names: true) }

                it "has same IDs" do
                    puts "json below"
                    expect(json.first[:id]).to equal(teachedlesson.id)
                end
            end
        end
    end
end
