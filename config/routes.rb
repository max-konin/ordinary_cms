OrdinaryCms::Engine.routes.draw do

  resources :pages, only: [:show, :update]

end
