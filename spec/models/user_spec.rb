require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :blogs }

  describe '#has_access_to?' do
    let(:user) { create(:user) }

    context 'when user has access to the resource' do
      it 'returns true' do
        resource = create(:blog, user_id: user.id)

        expect(user.has_access_to?(resource)).to be true
      end
    end

    context 'when user does not have access to the resource' do
      it 'returns false' do
        other_user = create(:user)
        resource = create(:blog, user_id: other_user.id)

        expect(user.has_access_to?(resource)).to be false
      end
    end
  end
end
