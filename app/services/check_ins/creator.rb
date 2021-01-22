module CheckIns
  class Creator < BaseService
    INCREMENT = 1

    def initialize(booking)
      @booking = booking
    end

    def call
      if flight.bookings.checked_in.count >= flight.aircraft.capacity
        booking.errors.add(:base, :overbooking)

        return false
      end

      booking.update(checked_in: true, seat_number: seat_number)
    end

    private

    private(*delegate(:flight, to: :booking))
    private(*delegate(:bookings, :aircraft, to: :flight))

    attr_reader :booking

    def seat_number
      ((1..aircraft.capacity).to_a - bookings.checked_in.order(seat_number: :asc).pluck(:seat_number).compact).first
    end
  end
end
