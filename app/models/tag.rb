class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, uniqueness: { case_sensitive: false }
  #Normally, I would just use Acts As Taggable On "...
end
