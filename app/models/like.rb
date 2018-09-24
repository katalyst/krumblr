class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, uniqueness: {scope: :user}
  #The views won't allow one user to like the same post multiple times, but it's bothering me.
  #https://stackoverflow.com/questions/34424154/rails-validate-uniqueness-of-two-columns-together
end
