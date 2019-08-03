Rails.application.routes.draw do
  # get 'doses/index'
  # get 'ingredients/index'
  # get 'cocktails/index'

  root "cocktails#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:create, :new]
  end
end
