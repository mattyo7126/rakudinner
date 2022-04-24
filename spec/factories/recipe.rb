FactoryBot.define do
  factory :recipe do
    title  {Faker::Lorem.characters(number: 40)}
  end
end 