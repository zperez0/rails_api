Rails.application.routes.draw do
  # root to: 'quotes#index'
  namespace :api do
    namespace :v1 do
      resources :quotes
    end
  end
end
