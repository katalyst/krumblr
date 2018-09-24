class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, presence: true,
                  length: { minimum: 1 }
  # validates :user, presence: true

  # validates_type :body, :string
end
