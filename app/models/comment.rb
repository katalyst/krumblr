class Comment < ApplicationRecord
	validates :body, presence: true
	validates_length_of :body, :maximum => 100
	scope :without_parent, -> {where(parent_id: nil)}

	belongs_to :user
	belongs_to :post
  has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  def parent
  	Comment.find_by(id: self.parent_id)
  end
end
