Rails.application.routes.draw do
  
  root           'sessions#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#login'

  post 'logout' => 'sessions#logout'
  
end
