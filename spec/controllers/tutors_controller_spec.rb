require 'rails_helper'

RSpec.describe TutorsController, type: :controller do
    describe "GET tutor#show" do
        context "show tutor without region" do
            let(:tutor) { FactoryBot.create(:tutor) }

            before(:each) do
                get :show, params: { id: tutor.id }
            end

            it "returns HTTP 200 OK" do
                expect(response).to have_http_status(:ok)
            end
    
            describe "JSON response body" do
                let(:json) { JSON.parse(response.body, symbolize_names: true) }
                
                it "has same ID" do
                    expect(json[:id]).to equal(tutor.id)
                end
    
                describe "member" do
                    let(:json_member) { json[:member] }

                    it "has same ID" do
                        expect(json_member[:id]).to equal(tutor.member.id)
                    end

                    it "does not have password_digest" do
                        expect(json_member).not_to have_key(:password_digest)
                    end
                end
    
                describe "regions" do
                    let(:json_regions) { json[:regions] }
                    
                    it "does not have any regions" do
                        expect(json_regions).to be_empty
                    end
                end
            end
        end

        context "show tutor with regions" do
            let(:tutor_with_regions) { FactoryBot.create(:tutor_with_tutor_regions) }

            before(:each) do
                get :show, params: { id: tutor_with_regions.id }
            end

            describe "JSON response body: region" do
                let(:json_regions) { JSON.parse(response.body, symbolize_names: true)[:regions] }

                it "has regions" do
                    expect(json_regions).not_to be_empty
                end

                it "has same IDs" do
                    expect(json_regions.map{ |region| region[:id] }).to eq(tutor_with_regions.tutor_regions.as_json.map{|region| region["id"]})
                end
            end
        end
    end

    describe "POST tutor#create" do
        it "rejects request with missing member" do
            expect {
              post :create
            }.to raise_error(ActionController::ParameterMissing)
          end
      
          context "valid parameter" do
            before(:each) do
              post :create, params: { member: FactoryBot.build(:tutor).as_json }
            end
      
            it "returns HTTP 200 OK" do
              expect(response).to have_http_status(:ok)
            end
      
            describe "JSON response body" do
              let(:json) { JSON.parse(response.body, symbolize_names: true) }
      
              it "has token" do
                expect(json).to have_key(:token)
              end
            end
        end
    end
end
