# frozen_string_literal: true

class UsersController < ApplicationController
  respond_to :html

  before_action :authorize_admin!

  helper_method :users, :user

  def index
    respond_with users
  end

  def update
    user.update(user_params)

    respond_with user
  end

  def destroy; end

  private

  def users
    @users ||= User.all
  end

  def user
    @user ||= params[:id] ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
