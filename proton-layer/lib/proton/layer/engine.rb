module Proton
  module Layer
    class Engine < ::Rails::Engine
      isolate_namespace Proton::Layer
    end
  end
end
