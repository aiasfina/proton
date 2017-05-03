Rails.application.routes.draw do
  mount Proton::Layer::Engine => "/proton-layer"
end
