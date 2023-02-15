Rails.application.routes.draw do
  get 'bot_settings/index'
  get 'bot_settings/start_bot'
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
