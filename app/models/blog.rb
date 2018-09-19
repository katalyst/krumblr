class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts

  def can_be_accessed_by?(user)
    user.blogs.include? self
  end
end
