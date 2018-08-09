require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #login" do
    it "rejects request with missing email" do
      expect {
        post :login, params: { password: FactoryBot.build(:member).password }
      }.to raise_error(ActionController::ParameterMissing)
    end

    it "rejects request with missing password" do
      expect {
        post :login, params: { email: FactoryBot.build(:member).email }
      }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
