OrdinaryCms::Engine.routes.draw do

  resources :pages, only: [:show, :update]

  root 'root#show'
end
