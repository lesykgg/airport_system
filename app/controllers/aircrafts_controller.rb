class AircraftsController < ApplicationController
  respond_to :html

  before_action :authorize_admin!

  helper_method :aircrafts, :aircraft

  def index
    respond_with aircrafts
  end

  def create
    with_flash_message(aircraft) do
      aircraft.assign_attributes(aircraft_params)

      aircraft.save
    end

    respond_with aircraft
  end

  def update
    with_flash_message(aircraft) { aircraft.update(aircraft_params) }

    respond_with aircraft
  end

  def destroy
    with_flash_message(aircraft) { aircraft.destroy }

    respond_with aircraft
  end

  private

  def aircrafts
    @aircrafts ||= Aircraft.all
  end

  def aircraft
    @aircraft ||= params.key?(:id) ? Aircraft.find(params[:id]) : Aircraft.new
  end

  def aircraft_params
    params.require(:aircraft).permit(:manufacturer, :model, :capacity, :airline_id)
  end
end
