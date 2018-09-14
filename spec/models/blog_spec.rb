require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should belong_to :user }
  it { should have_many :posts }
end
