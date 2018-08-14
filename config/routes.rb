Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:create, :delete] do
    post 'login', to: 'sessions#login'
  end

  resource :customer, only: [:show]
  resource :customers, only: [:create, :update, :delete]
end
