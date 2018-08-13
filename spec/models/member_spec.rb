require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { FactoryBot.build(:member) }

  describe "attributes" do
    it "should have attribute email" do
      expect(member).to respond_to(:email)
    end

    it "should have attribute password" do
      expect(member).to respond_to(:password)
    end

    it "should have attribute name" do
      expect(member).to respond_to(:name)
    end

    it "should have attribute phone_number" do
      expect(member).to respond_to(:phone_number)
    end

    it "should have attribute gender" do
      expect(member).to respond_to(:gender)
    end

    it "should have attribute street" do
      expect(member).to respond_to(:street)
    end

    it "should have attribute city" do
      expect(member).to respond_to(:city)
    end

    it "should be valid" do
      expect(member).to be_valid
    end

    it "name should be present" do
      member.name = "     "
      expect(member).to_not be_valid
    end

    it "email should be present" do
      member.email = "     "
      expect(member).to_not be_valid
    end

    it "phone number should be present" do
      member.phone_number = "     "
      expect(member).to_not be_valid
    end

    # it "phone_number should not be too long" do
    #   member.phone_number = "1" * 20
    #   expect(member).to_not be_valid
    # end

    it "email invalid format" do
      invalid_emails = %w[user@example,com user_at_test.org user.test@example.
                             test@test_test.com test@test+test.com test@test..com]
      invalid_emails.each do |invalid_emails|
        member.email = invalid_emails
        expect(member).to_not be_valid, "#{invalid_emails.inspect} should be invalid"
      end
    end
  end
end
