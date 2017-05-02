Rails.application.routes.draw do
  mount Proton::Core::Engine => "/proton-core"
end
