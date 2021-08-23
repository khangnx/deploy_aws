require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Associations" do
    it "belong to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
  describe "Validations" do
    subject { FactoryBot.create :post }
    it "is valid with valid attributes" do
      is_expected.to be_valid
    end
    it "is not valid with valid attributes" do
      subject.body = nil 
      is_expected.to_not be_valid
    end
    it "is not valid with too long body" do
      subject.body = "a"*502
      is_expected.to_not be_valid
    end
  end
end
