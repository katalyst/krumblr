require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user)           { User.new }
  let(:blog)           { Blog.new }
  let(:valid_params)   { {
    body: "text",
    blog: blog,
    user: user
  } }

  context "Creating a Post" do
    # before do
      # user.save
      # blog.save
    # end

    it "is valid with valid params" do
      expect(Post.new(valid_params)).to be_valid
    end

    it "is not valid without a user" do
      expect(Post.new(body: "text", blog: blog)).to_not be_valid
    end

    it "is not valid without a blog" do
      expect(Post.new(body: "text", user: user)).to_not be_valid
    end

    it "is not valid without a body" do
      expect(Post.new(blog: blog, user: user)).to_not be_valid
    end

    it "can only be of text form" do
      valid_params[:body] = 123
      expect(Post.new(valid_params).body).to be_kind_of(String)
    end
  end
end
