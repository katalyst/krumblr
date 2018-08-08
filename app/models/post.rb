class Post < ApplicationRecord
  belongs_to :blog

  validates :title, presence: true
  validates :content, presence: true

  scope :recent_first, -> { order(updated_at: :desc)}
end
