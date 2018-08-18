Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [] do
    post 'login', to: 'sessions#login'
  end

  resource :customer, only: [:show]
  resource :customers, only: [:create, :update, :delete]

  resource :tutor, only: [:show]
  resource :tutors, only: [:create, :update, :delete]

  resources :orders, only: [:create, :show, :index]

  # resource :history, only: [:show]
  get 'history', to: 'history#show'

  get 'classes', to: 'classes#show'
end
