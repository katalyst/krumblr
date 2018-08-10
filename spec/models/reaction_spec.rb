require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }

  it do
    should validate_inclusion_of(:kind).
      in_array(Reaction::VALID_REACTIONS)
  end
end
