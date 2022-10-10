# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :jogging_times

  get 'jogging_times/:fromDate/to/:toDate', to: 'jogging_times#filter'
  get 'current_user/index'
  devise_for :users,
             path: '', path_names: {
                         sign_in: 'login',
                         sign_out: 'logout',
                         registration: 'signup'
                       },

             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
