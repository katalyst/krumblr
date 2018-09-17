FactoryBot.define do
  factory :user do
  	sequence(:email) {|n| "test+#{n}@test.com" }
  	password 'password'
  	name 'test'
  end
end
