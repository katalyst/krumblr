require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should belong_to :user }
  it { should have_many :posts }

  describe '#can_be_accessed_by?(user)' do
    let(:user) { create(:user) }
    context 'when the referenced blog belongs to user' do
      it 'returns true' do
        blog = create(:blog, user_id: user.id)

        expect(blog.can_be_accessed_by?(user)).to be true
      end
    end
    
    context 'when the referenfed blog does not belong to user' do
      it 'returns false' do
        other_user = create(:user)
        other_blog = create(:blog, user_id: other_user.id)

        expect(other_blog.can_be_accessed_by?(user)).to be false
      end
    end
  end
end
