FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role :user
    trait(:manager) { role :manager }
    trait(:admin) { role :admin }
  end
end
