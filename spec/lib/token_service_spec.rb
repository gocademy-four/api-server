require 'rails_helper'

require 'token_service'

RSpec.describe TokenService do
  let(:member) { FactoryBot.build(:member) }

  describe "#build" do
    it "generates a decodeable JWT token" do
      expect {
        JWT.decode TokenService.issue({ sub: member.id }), nil, false
      }.not_to raise_error()
    end
  end

  describe "#issue" do
    it "generates a decodeable JWT token" do
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

  context "today is 2018-08-01 00:00:00" do
    before(:each) do
      Timecop.freeze Time.utc("2018-08-01 00:00:00")
    end

    after(:each) do
      Timecop.return
    end

    describe "#check" do
      it "accepts valid JWT token" do
        token = TokenService.issue(member.id)

        expect {
          TokenService.check token
        }.not_to raise_error()
      end

      it "rejects expired token" do
        token = TokenService.build({
          sub: member.id,
          exp: Time.utc("2017-07-01 00:00:00").to_i
        })

        expect {
          TokenService.check token
        }.to raise_error(JWT::ExpiredSignature)
      end

      it "rejects ineffective token" do
        token = TokenService.build({
          sub: member.id,
          exp: (Time.now - TokenService.token_period - 1.hour).to_i
        })

        expect {
          TokenService.check token
        }.to raise_error(JWT::ExpiredSignature)
      end
    end
  end
end
