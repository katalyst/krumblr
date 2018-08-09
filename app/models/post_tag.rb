class PostTag < ApplicationRecord
  belongs_to :tag
  belongs_to :post

  validates :tag, uniqueness: {scope: :post}
end
