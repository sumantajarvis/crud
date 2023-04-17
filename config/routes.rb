require 'sidekiq'
require 'sidekiq/web'
Rails.application.routes.draw do
  resources :posts
  mount SsoClient::Engine => "/sso_client", :as => "sso_client"
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
