require 'rails_helper'

RSpec.describe User, type: :model do
  context "Creating a User" do
    it "is valid with an email" do
      expect(User.new(email: "test@test.com", password: "12341234")).to be_valid
    end

    it "is not valid without an email" do
      expect(User.new(email: nil, password: "12341234")).to_not be_valid
    end

    it "is not valid without a password" do
      expect(User.new(email: "test@test.com", password: nil)).to_not be_valid
    end
  end
end
