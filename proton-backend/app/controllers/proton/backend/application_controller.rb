module Proton
  module Backend
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      before_action :require_login

      def not_authenticated
        redirect_to signin_url
      end

      protected
      def render_update_js(model)
        render 'proton/backend/share/update.js.erb', locals: {model: model}, layout: false
      end
    end
  end
end
