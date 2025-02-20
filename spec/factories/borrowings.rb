FactoryBot.define do
    factory :borrowing do
      user
      book
      due_date { Date.today + 14.days }
      returned { false }
    end
end
  