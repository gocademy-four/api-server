require 'rails_helper'

require 'token_service'

RSpec.describe CustomersController, type: :controller do
  let(:customer) { FactoryBot.create(:customer) }

  describe "GET #customer" do
    context "logged in" do
      before(:each) do
        request.headers['Authorization'] =
          "Bearer " + TokenService.issue(customer.member.id)
        post :show
      end

      it "returns HTTP 200 OK" do
        expect(response).to have_http_status(:ok)
      end

      describe "JSON response body" do
        let(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "has same ID" do
          expect(json[:id]).to equal(customer.id)
        end

        it "doesn't have member_id" do
          expect(json).not_to have_key(:member_id)
        end

        describe "member" do
          let(:json_member) { json[:member] }

          it "has same ID" do
            expect(json_member[:id]).to equal(customer.member.id)
          end

          it "doesn't have password digest" do
            expect(json_member).not_to have_key(:password_digest)
          end
        end
      end
    end
  end
end
