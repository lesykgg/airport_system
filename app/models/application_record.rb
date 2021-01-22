# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def base_airport
    @base_airport ||= Airport.find_by_iata(Rails.configuration.airport_iata)
  end
end
