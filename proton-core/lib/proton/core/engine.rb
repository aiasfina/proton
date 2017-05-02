module Proton
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Proton::Core
    end
  end
end
