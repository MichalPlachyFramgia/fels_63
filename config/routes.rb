Rails.application.routes.draw do
  namespace :admin do
    root "dashbroads#index"
    resources :words 
    resources :imports do 
      collection {post :create}
    end
    resources :users
    resources :categories
  end

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, except: [:destroy, :index]
  resources :words, only: :index
  resources :categories, only: :index
  resources :lessons, only: [:index, :show, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "users/:id/:type" => "relationships#index", as: "follows"
end
