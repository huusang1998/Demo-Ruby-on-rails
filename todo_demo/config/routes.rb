Rails.application.routes.draw do
  post 'session/login'
  post "tasks/create"
  resources :users,:tasks,:session
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
