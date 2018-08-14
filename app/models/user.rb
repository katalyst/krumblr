class User < ApplicationRecord
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged
    has_many :blogs
    has_many :comments
    has_secure_password

    def slug_candidates
        [
            [:first_name, :last_name],
        ]
    end
end
