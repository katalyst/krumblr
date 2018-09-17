require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'association' do
		it { User.reflect_on_association(:blogs).macro.should  eq(:has_many) }
		it { User.reflect_on_association(:posts).macro.should  eq(:has_many) }
	end
end
