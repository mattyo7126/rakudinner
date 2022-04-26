FactoryBot.define do
  factory :recipe do
    category_id { Faker::Number.between(from: 1, to: 11) }
    cooking_time_id { Faker::Number.between(from: 1, to: 6) }
    quantity_id { Faker::Number.between(from: 1, to: 6) }
    title { Faker::Lorem.characters(number: 40) }
    ingredients { Faker::Lorem.characters(number: 1000) }
    process { Faker::Lorem.characters(number: 1000) }
    point { Faker::Lorem.characters(number: 100) }
    extra { Faker::Lorem.characters(number: 100) }
    association :user

    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
