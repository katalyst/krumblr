Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'

  shallow do
    resources :blogs do
      resources :posts
    end
  end
end
