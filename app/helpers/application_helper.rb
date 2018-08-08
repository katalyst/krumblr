module ApplicationHelper
  def blog_or_root_path(blog)
    if blog
      link_to blog.name, blog_posts_path(blog), class: "nav-link"
    else
      link_to "Home", root_path, class: "nav-link"
    end
  end
end
