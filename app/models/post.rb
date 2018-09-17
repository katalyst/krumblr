class Post < ApplicationRecord
	include Taggable
	validates :title, :body, presence: true

	belongs_to :user
	belongs_to :blog
	has_many :comments, dependent: :destroy

	def to_param
		"#{self.id}-#{self.title.try(:parameterize)}"
	end

	def title_with_blog
		"#{blog.title} - #{self.title}"
	end
end
