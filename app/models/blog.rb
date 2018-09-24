class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :text, presence: true,
                  length: { minimum: 5 }
  # validates :user, presence: true
end
