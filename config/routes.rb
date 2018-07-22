# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  resources :employees
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update delete]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  delete '/delete-user/:id' => 'users#delete'
end
