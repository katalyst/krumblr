require 'rails_helper'

RSpec.describe Comment, type: :model do
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
		@post = create :post, user_id: @user.id, blog_id: @blog.id
	end

	describe 'association' do
		it { Comment.reflect_on_association(:user).macro.should  eq(:belongs_to) }
		it { Comment.reflect_on_association(:post).macro.should  eq(:belongs_to) }
		it { Comment.reflect_on_association(:replies).macro.should  eq(:has_many) }
	end

	describe '#parent' do
		it "should return parent comment" do
			comment_1 = create :comment, user_id: @user.id, post_id: @post.id
			user_2 = create :user
			comment_2 = create :comment, user_id: user_2.id, post_id: @post.id, parent_id: comment_1.id
			expect(comment_2.parent).to eq comment_1
		end
	end
end
