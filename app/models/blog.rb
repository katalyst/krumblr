class Blog < ApplicationRecord
    extend FriendlyId
    friendly_id :blogname, use: :slugged
    belongs_to :user
    has_many :posts
end
