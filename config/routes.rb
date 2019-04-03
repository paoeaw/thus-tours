Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  resources :tours, only: [:index, :show, :destroy, :new, :create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy, :index]

  namespace :providers do
    resources :bookings, only: [:index, :update]
    resources :tours, only: [:index]
  end

end
