require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it { should route(:get, '/blogs/blog_id/posts').to(action: :index, controller: :posts, blog_id: "blog_id") }
  it { should route(:get, '/blogs/blog_id/posts/post_id').to(action: :show, controller: :posts, blog_id: "blog_id", id: "post_id") }
  it { should route(:get, '/blogs/blog_id/posts/new').to(action: :new, controller: :posts, blog_id: "blog_id") }
  it { should route(:post, '/blogs/blog_id/posts').to(action: :create, controller: :posts, blog_id: "blog_id") }

end
