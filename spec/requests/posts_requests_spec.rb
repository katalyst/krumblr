require 'rails_helper'

RSpec.describe "posts", :type => :request do
  it "#index, shows all posts belonging to a blog, but not other posts" do
    post = create(:post)
    create(:post, title: "2nd post", blog: post.blog)

    another_blog = create(:blog, name: "Some other blog", user: post.blog.user)
    yet_another_post = create(:post, blog: another_blog)

    get blog_posts_path(post.blog)


    expect(response).to render_template(:index)

    #Note:  When the blog gets big, and inevitably we add infinite scroll, this will need to be updated.
    expect(response).to render_template(:partial => "_post", :count => 2)

  end

  it "#new, restricts access to logged in users" do
    user = create(:user, email: "logintest@email.com", password: "securesecret")
    blog = create(:blog)

    get new_blog_post_path(blog)

    expect(response).to redirect_to("/")

    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user

    get new_blog_post_path(blog)
    expect(response).to render_template(:new)
  end
end
