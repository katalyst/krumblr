require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:blog) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should have_many(:post_tags)}
  it { should have_many(:reactions) }
end
