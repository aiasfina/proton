module Proton
  module Backend
    class Engine < ::Rails::Engine
      isolate_namespace Proton::Backend
    end
  end
end
