Rails.application.routes.draw do
  get 'rooms/show'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/index'
  get 'posts/hashtag/:name', to: "posts#hashtag"
	devise_for :users, :controllers => {
   		:registrations => 'users/registrations',
   		:sessions => 'users/sessions',
   		:passwords => 'users/passwords'
  	}

  	root to: 'homes#top'

  resources :users, only: [:show, :edit, :update]
  resources :posts
  resources :rooms, only: [:show, :index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
