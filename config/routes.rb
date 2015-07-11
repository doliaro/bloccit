Rails.application.routes.draw do

	resources :posts

	resources :advertisements

  	get 'about' => 'welcome#about'

  	get 'contact' => 'welcome#contact'

  	get 'posts' => 'welcome#posts'

 	root to: 'welcome#index'

end
