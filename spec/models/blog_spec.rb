require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:user)           { User.new }
  let(:valid_params)   { {
    text: "string",
    user: user
  } }

  context "Creating a Blog" do
    # before do
      # user.save
    # end

    it "is valid with valid params" do
      expect(Blog.new(valid_params)).to be_valid
    end

    it "is not valid without a user" do
      expect(Blog.new(text: "string")).to_not be_valid
    end

    it "is not valid without a text" do
      expect(Blog.new(user: user)).to_not be_valid
    end

    it "must have length of 5 or greater" do
      valid_params[:text] = "abc"
      expect(Blog.new(valid_params)).to_not be_valid
    end
  end
end
