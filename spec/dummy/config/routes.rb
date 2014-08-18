Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount OrdinaryCms::Engine => "/ordinary_cms"
  mount Mercury::Engine => '/'
end
