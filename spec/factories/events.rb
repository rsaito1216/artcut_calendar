FactoryBot.define do
  factory :event do
    title {Faker::Name.name}
    description {Faker::Lorem.sentence}
    start_date {'2020-12-01 09:00:00'}
    end_date {'2020-12-01 10:00:00'}
    association :user
  end
end