require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe "associations" do
    it "belongs to one member" do
      assc = described_class.reflect_on_association(:member)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
