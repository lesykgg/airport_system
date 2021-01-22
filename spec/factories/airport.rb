FactoryBot.define do
  factory :airport do
    name { FFaker::Address.city }
    icao { 4.times.map { ('A'..'Z').to_a.sample }.join }
    iata { 3.times.map { ('A'..'Z').to_a.sample }.join }
    country { FFaker::Address.country }

    after(:create) do |airport|
      create_list(:gate, 3, airport: airport)
    end
  end
end
