module Users
  class AdminsController < ApplicationController
    def create
      with_flash_message(user) { user.make_admin! }

      redirect_to users_path
    end

    def destroy
      with_flash_message(user) { user.make_user! }

      redirect_to users_path
    end

    private

    def user
      @user ||= User.find(params[:user_id])
    end
  end
end
