module PostsHelper

  def reactions_for_post (post)
    result = Hash[Reaction::VALID_REACTIONS.product([0])]

    if post.is_a? Post
      result.merge! post.reactions.group(:kind).count
    end

    #Check if current_user has reacted to this post
    reaction = post.reactions.where(user: current_user).first

    render partial: "posts/post_reactions", locals: {post: post, reaction_hash: result, reaction: reaction }
  end

  def post_reaction_div_id(post)
    "post-#{post.id}-reactions"
  end
end
