class SearchController < ApplicationController
  def index
    queries = params.fetch(:query, "").split(/\s/)
    tag_queries = params.fetch(:query, "").scan(/#[\S]+/)

    title_search_posts = []
    tag_search_posts = []
    matched_tag_ids = []

    tag_queries.each do |possible_tag|
       #check if it's a tag
      tags = Tag.where(name: possible_tag.gsub("#", "").downcase)
      if tags.any?
        matched_tag_ids += tags.pluck(:id)
        tag_search_posts += PostTag.where(tag: tags).pluck(:post_id)
      end
    end

    queries.each do |sub_query|
      #Search titles for now
      #ignore sub_queries that are too short
      if sub_query.length >= 2
        title_search_posts += Post.where("lower(title) LIKE ?", "%#{sub_query.downcase}%").pluck(:id)
      end
    end

    related_tag_ids = PostTag.where(post_id: tag_search_posts).pluck(:tag_id)
    @related_tags = Tag.where(id: related_tag_ids - matched_tag_ids)
    @posts = Post.where(id: title_search_posts + tag_search_posts)
    @queries = queries

    render "dashboard/index"
  end
end
