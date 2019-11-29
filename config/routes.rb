Rails.application.routes.draw do
  resources :options
  resources :results
  resources :questions
  resources :quizzes do
    resources :badges
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end