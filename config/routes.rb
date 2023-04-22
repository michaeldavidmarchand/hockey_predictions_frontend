Rails.application.routes.draw do
  root to: 'splash#index'
  resources :predictions, only: %i[index show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
