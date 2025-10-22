Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # 👇 hello endpoint (basit kontrol için)
      get "/hello", to: "health#index"

      resources :users, only: [:index, :show] do
        resources :surveys, only: [:index, :create]
        resources :questions, only: [:index, :create]
      end

      resources :scales, only: [:index, :show, :create, :update, :destroy]
      resources :surveys, only: [:show, :update, :destroy] do
        resources :responses, only: [:index, :create]
      end

      resources :questions, only: [:show, :update, :destroy] do
        resources :responses, only: [:index, :create]
      end
    end
  end

  # 👇 kök URL'yi (/) hello'ya yönlendiriyoruz
  root to: redirect('/api/v1/hello')
end
