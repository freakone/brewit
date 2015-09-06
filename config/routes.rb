Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :beta_users, only: [:index, :create]
    end
  end
end
