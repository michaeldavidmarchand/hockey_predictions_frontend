Rails.application.routes.draw do
  root to: 'splash#index'
  resources :predictions, only: %i[index show]
end
