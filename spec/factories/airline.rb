FactoryBot.define do
  factory :airline do
    name { FFaker::Airline.name }
    shortened { 3.times.map { ('A'..'Z').to_a.sample }.join }
  end
end
