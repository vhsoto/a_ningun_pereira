Rails.application.routes.draw do
	
  devise_for :users
  resources :users, only: [:update, :show]
  resources :complaints do 
    resources :comments, only: [:create, :destroy, :update]
    post "/voto_acuerdo" => "votes#voto_acuerdo", as: :good
    post "/voto_desacuerdo" => "votes#voto_desacuerdo", as: :bad
  end
  get 'welcome/about'
  authenticated :user do
    root to: 'complaints#index', as: :authenticated_root
  end
  root 'welcome#index'
end
