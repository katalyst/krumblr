class Blog < ApplicationRecord
	validates :title, presence: true

	belongs_to :user
	has_many :posts, dependent: :destroy

	def to_param
		"#{self.id}-#{self.title.try(:parameterize)}"
	end
end
