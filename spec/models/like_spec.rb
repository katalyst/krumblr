require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user)           { User.new }
  let(:post)           { Post.new }
  let(:valid_params)   { {
    post: post,
    user: user
  } }

  context "Creating a Like" do
    it "is valid with valid params" do
      expect(Like.new(valid_params)).to be_valid
    end

    it "is not valid without a user" do
      expect(Like.new(user: user)).to_not be_valid
    end

    it "is not valid without a blog" do
      expect(Like.new(post: post)).to_not be_valid
    end

    context "duplicate likes" do
      before do
        like = Like.new(valid_params).save
      end

      it "is not valid if a duplicate like exists" do
        expect(Like.new(valid_params)).to_not be_valid
      end
    end
  end
end
