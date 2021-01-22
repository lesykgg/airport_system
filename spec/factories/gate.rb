FactoryBot.define do
  factory :gate do
    association :airport

    sequence(:index)
  end
end
