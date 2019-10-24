Rails.application.routes.draw do
  resources :categories do
    resources :comments, module: :categories
  end
  resources :posts do
    resources :comments, module: :posts
  end
  root 'home#show'
end
