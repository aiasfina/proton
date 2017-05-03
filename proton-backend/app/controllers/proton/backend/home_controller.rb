require_dependency "proton/backend/application_controller"

module Proton::Backend
  class HomeController < ApplicationController
    skip_before_action :require_login, only: [:signin, :create_session]

    def dashboard
    end

    def signin
      render layout: false
    end

    def create_session
      user = login(params[:email], params[:password], params[:remember_me])

      if user
        redirect_to root_url
      else
        flash.now[:alert] = "Email or password was invalid"
        render :signin, layout: false
      end
    end

    def destroy_session
      logout
      redirect_to signin_url
    end
  end
end
