# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :base_airport

  private

  def authorize_admin!
    return if current_user&.admin?

    flash[:danger] = t(:only_admin, scope: :users)

    redirect_to root_path
  end

  def with_flash_message(model, message = nil, &block)
    if block.call(model)
      flash[:success] = t('.success')
    else
      flash[:danger] = t('.failure', message: message ? message : model.errors.full_messages.to_sentence)
    end
  end

  def base_airport
    @base_airport ||= Airport.find_by_iata(Rails.configuration.airport_iata)
  end
end
