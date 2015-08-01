Rails.application.routes.draw do

  devise_for :users
	resources :posts

	resources :advertisements, only: [:show, :index]

	resources :questions do
		put :resolve
	end

  	get 'about' => 'welcome#about'

  	get 'contact' => 'welcome#contact'

  	get 'posts' => 'welcome#posts'

  	get 'questions' => 'welcome#questions'

 	root to: 'welcome#index'

end
