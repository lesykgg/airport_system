# frozen_string_literal: true

class Airline < ApplicationRecord
  validates :name, :shortened, presence: true

  has_many :aircrafts, dependent: :destroy
  has_many :flights, through: :aircrafts
end
