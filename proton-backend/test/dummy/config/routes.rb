Rails.application.routes.draw do
  mount Proton::Backend::Engine => "/proton-backend"
end
