class AirlinesController < ApplicationController
  respond_to :html

  before_action :authorize_admin!

  helper_method :airlines, :airline

  def index
    respond_with airlines
  end

  def create
    with_flash_message(airline) do
      airline.assign_attributes(airline_params)

      airline.save
    end

    respond_with airline
  end

  def update
    with_flash_message(airline) { airline.update(airline_params) }

    respond_with airline
  end

  def destroy
    with_flash_message(airline) { airline.destroy }

    respond_with airline
  end

  private

  def airlines
    @airlines ||= Airline.all
  end

  def airline
    @airline ||= params.key?(:id) ? Airline.find(params[:id]) : Airline.new
  end

  def airline_params
    params.require(:airline).permit(:name, :shortened)
  end
end
