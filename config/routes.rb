Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do 
      resources :comments, only: [:index,:create,:destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

 root to: "users#index"

 resources :users, param: :_user_id
 post 'api/login', to: 'authentication#login'

 namespace :api, defaults: { format: :json } do
     resources :users, only: %i[index show] do
       resources :posts, only: %i[index show] do
         resources :comments, only: %i[index show create]
       end
     end
   
 end
end