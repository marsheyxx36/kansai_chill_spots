Rails.application.routes.draw do
  get 'users/show'
  devise_for :users , controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'posts#index'
  resources :posts do
    # resource :likes, only: [:create, :destroy]
    resources :comments
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end

    collection do
      get 'site_description'
    end
  end
  resources :categorys do
    member do
      get 'area_show'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
   
  resources :users, only: [:show ,:edit,:update]do
    collection do
     get 'edit_password'
      put 'update_password'
    end

    member do
      get :following, :followers
    end

  end

  resources :relationships, only: [:create, :destroy]

end
