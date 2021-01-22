module Users
  class BookingsController < ApplicationController
    respond_to :html

    helper_method :bookings, :booking, :user

    def index
      respond_with bookings
    end

    def create
      with_flash_message(booking) { booking.assign_attributes(booking_params); booking.save }

      respond_with booking, location: user_booking_path(user, booking)
    end

    def update
      with_flash_message(booking) { booking.update(booking_params) }

      respond_with booking, location: user_booking_path(user, booking)
    end

    def destroy
      with_flash_message(booking) { booking.destroy }

      respond_with booking, location: user_bookings_path(user)
    end

    private

    def booking
      @booking ||= params.key?(:id) ? user.bookings.find(params[:id]) : user.bookings.build
    end

    def bookings
      @bookings ||= user.bookings
    end

    def user
      @user ||= User.find(params[:user_id])
    end

    def booking_params
      params.require(:booking).permit(:flight_id, :user_id)
    end
  end
end
