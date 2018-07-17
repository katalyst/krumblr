class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    belongs_to :blog
    has_many :comments
end
