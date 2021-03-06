require 'sorcery'

module Proton
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Proton::Core

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths['db/migrate'].expanded.each do |path|
            app.config.paths['db/migrate'] << path
          end
        end
      end
    end
  end
end
