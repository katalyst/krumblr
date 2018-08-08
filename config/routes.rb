Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"


  resources :blogs, only: [] do
    resources :posts
  end
end
