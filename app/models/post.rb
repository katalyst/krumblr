class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged
    belongs_to :blog
    has_many :comments, :dependent => :destroy

    def self.search(term)
        if term
            where('title LIKE ?', "%#{term}%").order('id DESC')
        else
            order('id DESC') 
        end
    end
end
