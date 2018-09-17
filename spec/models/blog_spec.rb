require 'rails_helper'

RSpec.describe Blog, type: :model do
	before do
		@user = create :user
		@blog = create :blog, user_id: @user.id
	end

	describe 'association' do
		it { Blog.reflect_on_association(:user).macro.should  eq(:belongs_to) }
		it { Blog.reflect_on_association(:posts).macro.should  eq(:has_many) }
	end

	describe '#to_params' do
		it "should return correct result" do
			expect(@blog.to_param).to eq "#{@blog.id}-#{@blog.title.parameterize}"
		end
	end
end
