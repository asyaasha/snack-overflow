Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers, only: [:create]
  end

  resources :answers, except: [:create] do
    resources :comments, only: [:create]
  end

  resources :comments, except: [:create]

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'questions#index'

end
