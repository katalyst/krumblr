class Post < ApplicationRecord
  belongs_to :blog
  has_many  :reactions, dependent: :destroy
  has_many  :post_tags
  has_many  :tags, through: :post_tags


  validates :title, presence: true
  validates :content, presence: true

  scope :recent_first, -> { order(updated_at: :desc)}
  scope :with_reactions, -> {includes(:reactions)}


end
