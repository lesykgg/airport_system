# frozen_string_literal: true

class Aircraft < ApplicationRecord
  validates :model, :capacity, :manufacturer, :airline, presence: true

  belongs_to :airline

  has_many :flights, dependent: :destroy

  def formatted_name
    "#{airline.name} #{manufacturer} #{model}"
  end
end
