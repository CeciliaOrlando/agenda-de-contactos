Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "contact", to: "pages#contact"

  resources :contacts
end
