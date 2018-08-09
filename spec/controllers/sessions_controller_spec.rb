require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #login" do
    it "rejects request with missing parameter" do
      expect {
        post :login
      }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
