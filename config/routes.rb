Rails.application.routes.draw do
  # get 'home/index'
  root :to => 'home#index'
  get 'quizzes/created', to: 'quizzes#created', as: 'quizzes_created'
  get 'badges/created', to: 'badges#created', as: 'badges_created'
  resources :options
  resources :results
  resources :quizzes do
    resources :badges
    resources :questions
  end
  devise_for :users
  resources :badges
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end