Rails.application.routes.draw do
  resources :manufacturers, only: [:index, :show, :new, :create] do
    resources :cars, only: :create
  end
  resources :cars, only: :index
end
