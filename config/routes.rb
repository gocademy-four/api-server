Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [] do
    post 'login', to: 'sessions#login'
  end

  resource :customer, only: [:show]
  resource :customers, only: [:create, :update, :delete]

  resources :orders, only: [:create, :show, :index]

  get 'members/tutors/:id',  to: 'tutors#show'
  get 'classes', to: 'classes#show'
end
