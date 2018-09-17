require 'rails_helper'

RSpec.describe Tag, type: :model do
	describe 'association' do
		it { Tag.reflect_on_association(:taggings).macro.should  eq(:has_many) }
		it { Tag.reflect_on_association(:posts).macro.should  eq(:has_many) }
	end
end
