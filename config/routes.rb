Rails.application.routes.draw do
	resources :sessions
	resource :users
	root 'sessions#new'
	get 'scrapbooks/show' => 'scrapbooks#show'
	get 'scrapbooks/new' => 'scrapbooks#new'
	post 'scrapbooks/create' => 'scrapbooks#create'
	post 'sessions/create' => 'sessions#create'
	post 'users/create' => 'users#create'
	get 'galleries/main' => 'galleries#index'
	get '/logout' => "sessions#destroy"
	resources :scrapbooks
	resources :friends
	resources :book_attachments
	resources :users
	resources :favorites, only: [:create, :destroy]
	resources :likes, only: [:create, :destroy]
	resources :galleries do
    	resources :images, :only => [:create]
   	end
  # For details on the DSL available  this file, see http://guides.rubyonrails.org/routing.html
end
