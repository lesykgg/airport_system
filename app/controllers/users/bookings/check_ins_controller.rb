module Users
  module Bookings
    class CheckInsController < ApplicationController
      respond_to :html

      def create
        with_flash_message(booking, booking.seat_number) { creator.call }

        respond_with booking, location: user_bookings_path(user)
      end

      def destroy
        with_flash_message(booking) { booking.update(checked_in: false, seat_number: nil) }

        respond_with booking, location: user_bookings_path(user)
      end

      private

      def creator
        CheckIns::Creator.new(booking)
      end

      def user
        @user ||= User.find(params[:user_id])
      end

      def booking
        @booking ||= user.bookings.find(params[:booking_id])
      end
    end
  end
end
