Rails.application.routes.draw do
  resources :users do
    resources :colors
  end
  namespace :user do
    resources :colors
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
