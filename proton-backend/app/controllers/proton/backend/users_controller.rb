require_dependency "proton/backend/application_controller"

module Proton::Backend
  class UsersController < ApplicationController
    before_action :set_user, except: [:index, :new, :create]

    def index
      @users = Proton::Core::User.all.page(params[:page])
    end

    def new
      @user = Proton::Core::User.new
    end

    def create
      @user = Proton::Core::User.new params.require(:user).permit!
      if @user.save
        redirect_to edit_user_url(@user)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update params.require(:user).permit!
        redirect_to edit_user_url(@user)
      else
        render :edit
      end
    end

    private
    def set_user
      @user = Proton::Core::User.find params[:id]
    end
  end
end
