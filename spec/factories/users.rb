FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    cooking_history_id    {Faker::Lorem.characters(number: 10)}
    introduction          {Faker::Lorem.characters(number: 40)}
  end
end