Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'todo/list'
  get 'todo/new'
  post 'todo/create'
  patch 'todo/update'
  get 'todo/show'
  get 'todo/edit'
  get 'todo/delete'
  get 'todo/mark_complete', 'todos#mark_complete'
  get 'todo/mark_not_complete', 'todos#mark_not_complete'
end
