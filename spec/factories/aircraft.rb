FactoryBot.define do
  factory :aircraft do
    association :airline

    manufacturer { 'Boeing' }
    model { 737 }
    capacity { rand(50..100) }
  end
end
