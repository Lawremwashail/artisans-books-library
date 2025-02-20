FactoryBot.define do
    factory :book do
      title { "Sample Book" }
      author { "Sample Author" }
      isbn { Faker::Number.unique.number(digits: 10).to_s }
      published_date { Date.today }
    end
end
  