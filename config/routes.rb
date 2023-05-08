Rails.application.routes.draw do
  root to: 'splash#index'
  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
  resources :predictions, only: %i[index show]
  resources :users, only: %i[show create] do
    resources :predictions, only: %i[show new edit create update destroy]
  end
end
