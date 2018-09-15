FactoryBot.define do
  factory :blog do
    association :user
    name "My Blog"
  end
end
