# frozen_string_literal: true

class Airport < ApplicationRecord
  validates :name, :iata, :icao, :country, presence: true

  has_many :gates
end
