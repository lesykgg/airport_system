# frozen_string_literal: true

class Gate < ApplicationRecord
  GATE_FORMAT = 'G%s'

  validates :index, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  belongs_to :airport

  def formatted_gate_index
    format(GATE_FORMAT, index)
  end
end
