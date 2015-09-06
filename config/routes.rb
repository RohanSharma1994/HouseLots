Rails.application.routes.draw do
  
  root           'sessions#index'

  get 'session' => 'sessions#new'

  post 'session' => 'sessions#login'

  post 'logout' => 'sessions#logout'
  
end
