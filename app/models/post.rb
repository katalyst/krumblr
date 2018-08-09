class Post < ApplicationRecord
  belongs_to :blog
  has_many  :reactions, dependent: :destroy
  has_many  :post_tags, dependent: :destroy
  has_many  :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true

  scope :recent_first, -> { order(updated_at: :desc)}
  scope :with_reactions, -> {includes(:reactions)}
  scope :with_tags, -> {includes(:tags)}

  attr_accessor :tag_string

  def tag_string
    tags.pluck(:name).map{|name| "##{name}"}.join(" ")
  end


  #sets all the tags for this post
  def tag_string=(string = "")
    hash_tags = string.split("#").map(&:parameterize).reject(&:blank?).uniq

    #Add tag objects
    hash_tags.each do |hash_tag|
      tag = Tag.where(name: hash_tag).first_or_create
      post_tags.where(tag: tag).first_or_create
    end

    #remove unwanted tags
    unwanted_tags = tags.where.not(name: hash_tags)
    post_tags.where(tag: unwanted_tags).destroy_all
  end
end
