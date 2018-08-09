require 'rails_helper'

RSpec.describe TutorRegion, type: :model do
  let(:tutor_region) { TutorRegion.new }

  describe "attributes" do
    it "should have attribute location" do
      expect(tutor_region).to respond_to(:location)
    end
  end
  
  describe "associations" do
    it "belongs to tutor" do
      assc = described_class.reflect_on_association(:tutor)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
