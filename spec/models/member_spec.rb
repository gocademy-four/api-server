require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { Member.new }

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
  end
end