Rails.application.routes.draw do
  resources :devis do
    resources :produits
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "devis#index"
end
