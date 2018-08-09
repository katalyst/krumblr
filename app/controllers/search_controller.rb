class SearchController < ApplicationController
  def index
    queries = params[:query].to_s.parameterize.split("-")

    title_search_posts = []
    tag_search_posts = []
    matched_tag_ids = []

    queries.each do |sub_query|
      #check if it's a tag
      possible_tag = sub_query.gsub("#", "")
      tags = Tag.where("lower(name) LIKE ? ", "%#{possible_tag.downcase}%")
      if tags.any?
        matched_tag_ids += tags.pluck(:id)
        tag_search_posts += PostTag.where(tag: tags).pluck(:post_id)
      end

      #Search titles for now
      #ignore sub_queries that are too short
      if sub_query.length >= 2
        title_search_posts += Post.where("lower(title) LIKE ?", "%#{sub_query.downcase}%").pluck(:id)
      end
    end

    related_tag_ids = PostTag.where(post_id: tag_search_posts).pluck(:tag_id)
    @related_tags = Tag.where(id: related_tag_ids - matched_tag_ids)
    @posts = Post.where(id: title_search_posts + tag_search_posts)

    render "dashboard/index"
  end
end
