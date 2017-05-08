Proton::Backend::Engine.routes.draw do
  root to: 'home#dashboard'
  get 'signin' => 'home#signin', as: :signin
  post 'signin' => 'home#create_session', as: :create_session
  delete 'signout' => 'home#destroy_session', as: :destroy_session

  resources :posts
  resources :users
  resources :layouts
  resources :pages do
    get 'preview', on: :member
  end
end
