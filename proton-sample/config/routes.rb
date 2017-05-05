Rails.application.routes.draw do
  mount Proton::Backend::Engine => '/backend'
  mount Proton::Layer::Engine => '/layer'
end
