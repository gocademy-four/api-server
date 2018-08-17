Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [] do
    post 'login', to: 'sessions#login'
  end

  resource :customer, only: [:show]
  resource :customers, only: [:create, :update, :delete]

  resource :order, only: [:create]

  get 'members/tutors/:id',  to: 'tutors#show'
end
