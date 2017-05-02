require_dependency "proton/backend/application_controller"

module Proton::Backend
  class HomeController < ApplicationController
    before_action :require_login, except: [:signin, :create_session]

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
  end
end
