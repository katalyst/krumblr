require 'rails_helper'

RSpec.describe "dashboard", :type => :request do
  it "#index, shows all the posts " do
    post = create(:post)
    create(:post, title: "2nd post", blog: post.blog)

    get "/"


    expect(response).to render_template(:index)

    #Note:  When the blog gets big, and inevitably we add infinite scroll, this will need to be updated.
    expect(response).to render_template(:partial => "_post", :count => Post.count)

  end
end
