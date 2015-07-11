Rails.application.routes.draw do

	resources :posts

	resources :advertisements, only: [:show, :index]

  	get 'about' => 'welcome#about'

  	get 'contact' => 'welcome#contact'

  	get 'posts' => 'welcome#posts'

 	root to: 'welcome#index'

end
