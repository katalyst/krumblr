module Taggable
	extend ActiveSupport::Concern

	included do
		has_many :taggings, dependent: :destroy
		has_many :tags, through: :taggings 
	end
end