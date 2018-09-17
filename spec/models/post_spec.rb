require 'rails_helper'

RSpec.describe Post, type: :model do
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
		@post = create :post, user_id: @user.id, blog_id: @blog.id
	end

	describe 'association' do
		it { Post.reflect_on_association(:user).macro.should  eq(:belongs_to) }
		it { Post.reflect_on_association(:blog).macro.should  eq(:belongs_to) }
		it { Post.reflect_on_association(:comments).macro.should  eq(:has_many) }
	end

	describe '#to_params' do
		it "should return correct result" do
			expect(@post.to_param).to eq "#{@post.id}-#{@post.title.parameterize}"
		end
	end

	describe '#title_with_blog' do
		it "should return correct result" do
			expect(@post.title_with_blog).to eq "#{@post.blog.title} - #{@post.title}"
		end
	end
end
