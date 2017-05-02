require 'gentelella-rails'

module Proton
  module Backend
    class Engine < ::Rails::Engine
      isolate_namespace Proton::Backend

      initializer "spree.assets.precompile", group: :all do |app|
        app.config.assets.paths << "#{Rails.root}/app/assets/fonts"
        app.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

        app.config.assets.precompile += %w[]
      end
    end
  end
end
