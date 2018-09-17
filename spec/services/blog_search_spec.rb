require 'rails_helper'

RSpec.describe BlogSearch do
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id, title: "blog"
		@tag = create :tag, name: 'tag'
		@post = create :post, user_id: @user.id, blog_id: @blog.id, title: "post", body: "body", tag_ids: [@tag.id]
		@post_1 = create :post, user_id: @user.id, blog_id: @blog.id, title: "empty", body: "empty"
	end

	describe '#search' do
		it "should return posts by search post body" do
			blog_search = BlogSearch.new(contents: 'body')
			expect(blog_search.search.count).to eq 1
		end

		it "should return posts by search post title" do
			blog_search = BlogSearch.new(contents: 'post')
			expect(blog_search.search.count).to eq 1
		end

		it "should return posts by search tag name" do
			blog_search = BlogSearch.new(contents: 'tag')
			expect(blog_search.search.count).to eq 1
		end

		it "should return posts by search blog title" do
			blog_search = BlogSearch.new(contents: 'blog')
			expect(blog_search.search.count).to eq 2
		end
	end
end