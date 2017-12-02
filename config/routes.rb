Rails.application.routes.draw do

  	devise_for :users
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/books/about' => 'books#about'

	resources :books
	resources :users, only: [:index, :show, :new,:create, :edit, :update ]

	get '/books/new' => 'books#new'
	root 'books#top'

end
