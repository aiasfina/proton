Rails.application.routes.draw do
  mount Proton::Backend::Engine => '/backend'
end
