require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it "has many post" do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
  end
  describe "Validations" do
    subject { FactoryBot.create :user }
    it "valid attributes" do
      is_expected.to be_valid
    end
    it "invalid attributes email" do
      subject.name = nil
      is_expected.to_not be_valid
    end
  end
end
