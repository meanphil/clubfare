Clubfare::Application.routes.draw do
	resources :beers
	resources :sessions, only: [:new, :create, :destroy]
	root 'beers#dash'
	match '/dash',		to: 'beers#dash',			via: 'get'
	match '/signin',	to: 'sessions#new',			via: 'get'
	match '/signout',	to: 'sessions#destroy',		via: 'delete'
	match '/api',		to: 'api#index',			via: 'get'
	match '/api/beers',	to: 'api#beers',			via: 'get'
end
