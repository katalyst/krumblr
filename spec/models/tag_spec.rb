require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many(:post_tags)}
  it { should validate_uniqueness_of(:name).case_insensitive }
end
