Rails.application.routes.draw do

  # Root Path
  root 'welcome#home'

  # Devise
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  # Resources
  resources :books do
    resources :chapters, only: [:new]
  end
  
  resources :chapters, except: [:index] do
    resources :important_dates, only: [:new]
    resources :pages, only: [:new]
  end
  
  resources :pages, except: [:index] do
    resources :entries, only: [:new]
    resources :tasks, only: [:new]
  end
  
  resources :important_dates, except: [:index, :show]
  
  resources :tasks, only: [:create, :destroy]
  
  resources :entries, only: [:create, :show, :destroy]
  
  get '/entries/:id/next', to: 'entries#next'


  # Regular Routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
