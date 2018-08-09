class Post < ApplicationRecord
  belongs_to :blog
  has_many  :reactions, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :recent_first, -> { order(updated_at: :desc)}
  scope :with_reactions, -> {includes(:reactions)}


end
