Rails.application.routes.draw do

  root to: 'site#index'

  resources :users
  resources :records
  resources :trackers
  resources :feedbacks

end
