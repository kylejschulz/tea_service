Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/:customer_id/subscriptions', to: 'customer_subscriptions#index'
      put '/customers/:customer_id/subscriptions/:subscription_id', to: 'customer_subscriptions#update'
      post '/customers/:customer_id/subscriptions/:subscription_id', to: 'customer_subscriptions#create'
      resources :customers, only: [:index]
      resources :subscriptions, only: [:index, :show]
    end
  end
end
