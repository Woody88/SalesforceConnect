Rails.application.routes.draw do
  root 'main#login'
  post 'login_', to: :login, controller: 'main'

  resources :sf_cases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
