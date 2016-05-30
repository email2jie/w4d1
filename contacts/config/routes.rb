Rails.application.routes.draw do

  get 'contacts/show'

  get 'contacts/new'

  get 'contacts/create'

  get 'contacts/edit'

  get 'contacts/update'

  get 'contacts/destroy'

  #resources :users

  # get 'users' => 'users#index', :as => 'users'
  # get 'users/:id' => 'users#show', :as => 'user'
  # post 'users' => 'users#create'
  get 'users/new' => 'users#new', :as => 'new_user'
  get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # patch 'users/:id/' => 'users#update'
  # put 'users/:id/' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

  resources :user, only: [:index, :show, :create, :update, :destroy] do
    resources :contact, only: [:index]
  end
  resources :contact_share, only: [:create, :destroy]



end
