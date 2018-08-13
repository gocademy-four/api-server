require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #login" do
    let (:member) { FactoryBot.create(:member) }

    it "rejects request with missing email" do
      expect {
        post :login, params: { password: member.password }
      }.to raise_error(ActionController::ParameterMissing)
    end

    it "rejects request with missing password" do
      expect {
        post :login, params: { email: member.email }
      }.to raise_error(ActionController::ParameterMissing)
    end

    it "rejects request with unknown member" do
      expect {
        post :login, params: {
          email: "garbage" + member.email,
          password: member.password
        }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "rejects request with known member but wrong password" do
      expect {
        post :login, params: {
          email: member.email,
          password: "garbage" + member.password
        }
      }.to raise_error(AbstractController::ActionNotFound)
    end

    context "email and username is valid" do
      before(:each) do
        post :login, params: {
          email: member.email,
          password: member.password
        }
      end

      it "returns a token" do
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to have_key(:token)
      end
    end

    it "returns HTTP 200 OK status" do
      expect(response).to have_http_status(:ok)
    end
  end
end
