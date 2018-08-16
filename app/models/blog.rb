class Blog < ApplicationRecord
  belongs_to :user

  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
