FactoryBot.define do
  factory :post do
    association :blog
    body "My Post"
  end
end
