Rails.application.routes.draw do
  devise_for :users


  resources :users, only: [:index, :show] do 
    resources :posts do 
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
 root to: "users#index"
end
