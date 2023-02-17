Rails.application.routes.draw do
  resources :channels
  get 'bot_settings/index'
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
