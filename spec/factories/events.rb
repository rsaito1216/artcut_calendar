FactoryBot.define do
  factory :event do
    title {Faker::Name.name}
    description {Faker::Lorem.sentence}
    start_date {Time.zone.now}
    end_date {'2020-12-01 10:00:00'}
    association :user
  end
end