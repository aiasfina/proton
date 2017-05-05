Proton::Layer::Engine.routes.draw do
  get '/assets/:identify.js' => 'assets#render_js', as: :js
  get '/assets/:identify.css' => 'assets#render_css', as: :css
end
