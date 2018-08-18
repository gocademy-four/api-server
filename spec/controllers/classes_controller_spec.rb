require 'rails_helper'

RSpec.describe ClassesController, type: :controller do
    describe "GET class#show" do

        context "find classes without parameter" do
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
                    expect(json.first[:id]).to equal(teachedlesson.id)
                end
            end
        end

        context "find classes with parameter" do
            let(:teachedlessons) { FactoryBot.create_list(:teachedlesson, 2) }
            
            context "with category_id parameter" do
                before(:each) do
                    get :show, params: { id: teachedlessons.first.id, category_id: teachedlessons.first.lesson.category_id }
                end

                describe "JSON response body" do
                    let(:json) { JSON.parse(response.body, symbolize_names: true) }
                        
                    it "returns only one out of two teachedlessons" do
                        expect(json.size).to eq(1)
                    end

                    it "return teached lesson with same category_id" do
                        expect(Lesson.where(id: json.first[:lesson_id]).first.category_id). to eq(teachedlessons.first.lesson.category_id)
                    end
                end
            end

            context "with lesson_id parameter" do
                before(:each) do
                    get :show, params: { id: teachedlessons.first.id, lesson_id: teachedlessons.first.lesson_id }
                end

                describe "JSON response body" do
                    let(:json) { JSON.parse(response.body, symbolize_names: true) }
                        
                    it "returns only one out of two teachedlessons" do
                        expect(json.size).to eq(1)
                    end

                    it "return teached lesson with same lesson_id" do
                        expect(json.first[:lesson_id]).to eq(teachedlessons.first.lesson_id)
                    end

                end
            end
        end
    end
end
