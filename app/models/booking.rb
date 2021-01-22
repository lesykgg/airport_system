class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  scope :checked_in, -> { where(checked_in: true) }
end
