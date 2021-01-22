# frozen_string_literal: true

class Flight < ApplicationRecord
  validates :from, :destination, :arrival, :departure, :gate, :number, presence: true

  belongs_to :aircraft

  belongs_to :from, class_name: :Airport
  belongs_to :destination, class_name: :Airport
  belongs_to :gate

  has_one :airline, through: :aircraft

  has_many :bookings

  validate :base_airport_inclusion

  scope :actual, -> do
    where(arel_table[:arrival].gteq(Time.now))
      .or(where(arel_table[:departure].gteq(Time.now)))
      .order(:departure)
  end

  def formatted_number
    "#{airline.shortened} #{number}"
  end

  def arrival?
    from == base_airport
  end

  def departure?
    !arrival?
  end

  private

  def base_airport_inclusion
    return if [from, destination].include?(base_airport)

    errors.add(:base, :base_airport_inclusion)
  end
end
