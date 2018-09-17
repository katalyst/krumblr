class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts

  def can_be_accessed_by?(user)
    return true if user.blogs.include? self
    false
  end
end
