Rails.application.routes.draw do
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes, only: [:index, :show, :create, :update, :destroy]
  namespace :api do
  # resources :recipes, only: [:index, :show, :create, :update, :destroy]
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
end
end
