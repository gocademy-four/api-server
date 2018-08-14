require 'rails_helper'

require 'token_service'

RSpec.describe TokenService do
  it "responds to issue" do
    expect(TokenService).to respond_to(:issue)
  end

  it "responds to check" do
    expect(TokenService).to respond_to(:check)
  end

  describe "#issue" do
    let(:member) { FactoryBot.build(:member) }

    it "generate a decodeable JWT token" do
      expect {
        JWT.decode TokenService.issue(member.id), nil, false
      }.not_to raise_error()
    end

    describe "token body" do
      let (:body) { JWT.decode(TokenService.issue(member.id), nil, false)[0] }

      it "has iat" do
        expect(body).to have_key("iat")
      end

      it "has exp" do
        expect(body).to have_key("exp")
      end

      it "has sub == member.id" do
        expect(body["sub"]).to equal(member.id)
      end
    end
  end
end
