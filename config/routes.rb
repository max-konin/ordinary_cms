OrdinaryCms::Engine.routes.draw do

  resources :pages, only: [:show, :update]

  namespace :mercury do
    resources :images
  end

  root 'root#show'
end
