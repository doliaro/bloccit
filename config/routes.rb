Rails.application.routes.draw do

    devise_for :users
    resources :users, only: [:update]

    resources :users, only: [:show, :index]

    resources :topics do
      resources :posts, except: [:index]
    end

    resources :posts, only: [] do
      resources :comments, only: [:create, :destroy]
    end

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
