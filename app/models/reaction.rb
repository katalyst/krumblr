class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  VALID_REACTIONS = ["😃","😂","😕","😭"]

  validates :kind, inclusion: { in: VALID_REACTIONS}
end
