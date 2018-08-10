require 'rails_helper'

RSpec.describe PostTag, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:tag) }
  it { should validate_uniqueness_of(:tag_id).scoped_to(:post_id) }
end
