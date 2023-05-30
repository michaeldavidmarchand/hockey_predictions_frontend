Rails.application.routes.draw do
  root to: 'splash#index'
  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
  get "/sessions/logout", to: "sessions#destroy"
  resources :predictions, only: %i[index show]
  resources :leaderboard, only: %i[index]
  resources :users, only: %i[show create] do
    resources :predictions, only: %i[show new edit create update destroy]
  end
end
