Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello', to: 'hello#test'

  resource :session, only: [:create, :delete] do
    post 'login', to: 'sessions#login'
  end
end
