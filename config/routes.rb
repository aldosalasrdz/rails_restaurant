Rails.application.routes.draw do
  resources :restaurants do
    resources :dishes, except: [:show]
    resources :orders do
      resources :items, except: [:index, :show]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end
