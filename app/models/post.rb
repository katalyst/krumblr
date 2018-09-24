class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :body, presence: true,
                  length: { minimum: 1 }
  # validates :user, presence: true

  # validates_type :body, :string
end
