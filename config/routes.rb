Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # root to: 'quotes#index'
  namespace :api do
    namespace :v1 do
      resources :quotes
    end
    namespace :v2 do
      resources :quotes
    end
  end
end
