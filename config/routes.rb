Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  # root to: 'posts#new'
  resources :posts
  resources :comments, only: %i[create destroy]
end
