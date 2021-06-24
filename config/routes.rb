Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "pages#home"
  resources :apartments
  resources :bookings do
    resources :payments
  end 
end
