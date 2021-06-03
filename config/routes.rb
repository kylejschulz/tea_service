Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/:id/subscriptions', to: 'customersubscriptions#index'
      delete '/customers/:customer_id/subscriptions/:subscription_id', to: 'customersubscriptions#destroy'
      post '/customers/:customer_id/subscriptions/:subscription_id', to: 'customersubscriptions#create'
      resources :customers do
      end
    end
  end
end
