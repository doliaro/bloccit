Rails.application.routes.draw do
<<<<<<< HEAD

	resources :posts

	get 'about' => 'welcome#about'
=======
  resources :posts

  get 'about' => 'welcome#about'

  get 'contact' => 'welcome#contact'
>>>>>>> crud

	get 'contact' => 'welcome#contact'

 	root to: 'welcome#index'

end
