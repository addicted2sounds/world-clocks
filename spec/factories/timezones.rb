FactoryGirl.define do
  factory :timezone do
    user
    name { Faker::Lorem.word }
    city { Faker::Address.city }
    difference { Faker::Number.between(-12, 12) }
  end
end
