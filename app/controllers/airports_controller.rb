class AirportsController < ApplicationController
  respond_to :html

  before_action :authorize_admin!

  helper_method :airports, :airport

  def index
    respond_with airports
  end

  def create
    with_flash_message(airport) do
      airport.assign_attributes(airport_params)

      airport.save
    end

    respond_with airport
  end

  def update
    with_flash_message(airport) { airport.update(airport_params) }

    respond_with airport
  end

  def destroy
    with_flash_message(airport) { airport.destroy }

    respond_with airport
  end

  private

  def airports
    @airports ||= Airport.all
  end

  def airport
    @airport ||= params.key?(:id) ? Airport.find(params[:id]) : Airport.new
  end

  def airport_params
    params.require(:airport).permit(:manufacturer, :model, :capacity, :airline_id)
  end
end
