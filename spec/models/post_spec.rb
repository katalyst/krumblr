require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create :post }

  it { should belong_to :blog }
  it { should have_many :comments }

  describe '#tag_list' do
    context 'when a post has associated tags' do
      it 'returns tags as string separated by comma' do
        ['tag1', 'tag2'].each do |tag|
          post.tags << create(:tag, name: tag)
        end

        expect(post.tag_list).to eq 'tag1, tag2'
      end
    end

    context 'when a post does not have assiciated tags' do
      it 'returns empty string' do
        expect(post.tag_list).to eq ''
      end
    end
  end

  describe '#tag_list=' do
    it 'sets tag names into tag model associated with current post' do
      tags_string = 'tag1, tag2'
      post.tag_list=(tags_string)

      expect(post.tag_list).to eq 'tag1, tag2'
    end
  end
end
