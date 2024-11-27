require "rails_helper"

RSpec.describe Spirit, type: :model do
  describe "validations" do
    it "requires name to be present" do
      spirit = FactoryBot.build(:spirit, name: "Buffalo Trace")
      spirit.save
      expect(spirit.errors).to be_empty
    end

    it "requires name to be present" do
      spirit = FactoryBot.build(:spirit, name: "Buffalo Trace")
      expect(spirit.save).to eq(true)
    end

    it "requires the spirt name to be at least 3 letters long" do
      spirit = FactoryBot.build(:spirit, name: "KB")
      expect(spirit.save).to eq(false)
      expect(spirit.errors[:name]).to eq(["is too short (minimum is 3 characters)"])
    end

    it "requires the spirt name to be not nil" do
      spirit = FactoryBot.build(:spirit, name: nil)
      expect(spirit.save).to eq(false)
      # binding.pry
      expect(spirit.errors[:name]).to include("can't be blank")
    end
  end
end