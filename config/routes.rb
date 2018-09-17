Rails.application.routes.draw do
	mount Ckeditor::Engine => '/ckeditor'
	root  to: 'pages#index'
	get   "/post/:id", to: "pages#post_show", as: :post
	get   "/blog/:id", to: "pages#blog_show", as: :blog
	post  "/blog_search", to: "pages#blog_search", as: :blog_search

	devise_for :users, controllers: { 
		sessions: 'users/sessions', 
		registrations: 'users/registrations',
		passwords: 'users/passwords'
	}
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :users, path: "user" do
		resources :blogs
		resources :posts
		resources :comments
	end
end
