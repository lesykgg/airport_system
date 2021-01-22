# frozen_string_literal: true

module Flights
  class Base < BaseService
    def initialize(flight, flight_params)
      @flight = flight
      @flight_params = flight_params
    end

    def call
      raise NotImplementedError
    end

    private

    attr_reader :flight, :flight_params

    def prepared_params
      @prepared_params ||= flight_params.tap do |hash|
        hash[:departure] = begin
                             DateTime.parse(hash[:departure])
                           rescue StandardError
                             nil
                           end
        hash[:arrival] = begin
                           DateTime.parse(hash[:arrival])
                         rescue StandardError
                           nil
                         end
      end
    end
  end
end
