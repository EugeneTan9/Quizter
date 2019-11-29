Rails.application.routes.draw do
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