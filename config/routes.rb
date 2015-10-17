Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get :app, to: "app#index"

  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :beta_users, only: [:index, :create]
    end
  end
end
