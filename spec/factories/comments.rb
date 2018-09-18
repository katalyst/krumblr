FactoryBot.define do
  factory :comment do
    association :post
    body "My first comment"
  end
end
