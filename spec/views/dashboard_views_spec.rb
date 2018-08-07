require 'rails_helper'

RSpec.describe "dashboard/index", :type => :view do
  it "renders _event partial for each event" do
    assign(:posts, [build(:post), build(:post)])
    render
    expect(view).to render_template(:partial => "_post", :count => 2)
  end
end
