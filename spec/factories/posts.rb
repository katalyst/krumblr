FactoryBot.define do
  factory :post do
    blog
    user
    title 'Post Title'
    body 'Post Body'
  end
end
