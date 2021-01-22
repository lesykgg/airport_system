# frozen_string_literal: true

class FlightsController < ApplicationController
  respond_to :html

  skip_before_action :authenticate_user!
  before_action :authorize_admin!, except: %i[index show]
  before_action :authenticate_user!, except: %i[index show]

  helper_method :flights, :flight

  def index
    respond_with flights do |format|
      format.html { render 'index', layout: false } if request.xhr?
    end
  end

  def create
    with_flash_message(flight) { creator.call }

    respond_with flight
  end

  def update
    with_flash_message(flight) { flight.update(flight_params) }

    respond_with flight
  end

  def destroy
    with_flash_message(flight) { flight.destroy }

    respond_with flight
  end

  private

  def flights
    @flights ||= Flight.actual
  end

  def flight
    @flight ||= params[:id] ? Flight.find(params[:id]) : Flight.new
  end

  def creator
    Flights::Creator.new(flight, flight_params)
  end

  def updater
    Flights::Updater.new(flight, flight_params)
  end

  def flight_params
    params
      .require(:flight)
      .permit(
        :from_id,
        :destination_id,
        :departure,
        :arrival,
        :gate_id,
        :aircraft_id,
        :number
      )
  end
end
