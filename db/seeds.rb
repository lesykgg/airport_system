# frozen_string_literal: true

unless Airport.exists?
  data = YAML.load_file(Rails.root.join('db/fixtures/airports.yml')).map(&:deep_symbolize_keys)

  data.each do |airport_data|
    airport = Airport.create(airport_data.except(:gates_count))

    airport_data[:gates_count].times { |i| airport.gates.create(index: i + 1) }
  end
end

unless Airline.exists?
  data = YAML.load_file(Rails.root.join('db/fixtures/airlines.yml')).map(&:deep_symbolize_keys)

  airlines = data.map { |airline_data| Airline.create(airline_data) }

  data = YAML.load_file(Rails.root.join('db/fixtures/aircrafts.yml')).map(&:deep_symbolize_keys)

  airlines.each do |airline|
    data.each do |aircraft_data|
      airline.aircrafts.create(aircraft_data)
    end
  end
end

unless User.exists?
  User.create(
    first_name: 'John',
    last_name: 'Doe',
    email: 'admin@example.com',
    password: 'changeme',
    admin: true
  )
end

base_airport = Airport.find_by_iata(Rails.configuration.airport_iata)

other_airports = Airport.all - [base_airport]
time_now = Time.now
end_of_range = Time.now + 3.months
other_airports.each do |destination|
  departure = Time.at((end_of_range.to_f - time_now.to_f) * rand + time_now.to_f)
  arrival = departure + rand(1..10).hours
  Flight.create(
    aircraft: Aircraft.all.sample,
    from: base_airport,
    destination: destination,
    departure: departure,
    arrival: arrival,
    gate: base_airport.gates.sample,
    number: rand(100..999)
  )
end

other_airports.each do |from|
  departure = Time.at((end_of_range.to_f - time_now.to_f) * rand + time_now.to_f)
  arrival = departure + rand(1..10).hours
  Flight.create(
    aircraft: Aircraft.all.sample,
    from: from,
    destination: base_airport,
    departure: departure,
    arrival: arrival,
    gate: base_airport.gates.sample,
    number: rand(100..999)
  )
end
