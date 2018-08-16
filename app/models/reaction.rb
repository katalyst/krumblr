class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  VALID_REACTIONS = ["😃","😂","😕","😭"]
  validates :user_id, uniqueness: {scope: :post_id}
  validates :kind, inclusion: { in: VALID_REACTIONS}
end
