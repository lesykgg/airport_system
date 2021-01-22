# frozen_string_literal: true

module Flights
  class Creator < Base
    def call
      flight.assign_attributes(prepared_params)

      flight.save
    end
  end
end
