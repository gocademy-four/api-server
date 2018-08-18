require 'rails_helper'

RSpec.describe TeachedlessonsController, type: :controller do
    describe "POST teachedlesson#create" do
		let(:tutor) { FactoryBot.create(:tutor) }
		let(:lesson) { FactoryBot.create(:lesson) }

		context "logged in" do
            before(:each) do
                post :create, params: { tutor_id: tutor.id, lesson_name: lesson.name, price_per_hour: 10}
            end

            it "returns HTTP 200 OK" do
                expect(response).to have_http_status(:ok)
            end
				
            it "has one teachedlesson in db" do
            	expect(Teachedlesson.all.length).to eq(1)
            end
        end
	end
end
