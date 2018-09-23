Rails.application.routes.draw do

  resources :blogs do
    resources :posts
  end

  devise_for :users

  root "blogs#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
