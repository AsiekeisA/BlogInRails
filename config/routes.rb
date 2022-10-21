Rails.application.routes.draw do
  devise_for :users
  resources :posts, :only => [:index, :show] do
    resources :comments, :only => [:create]
  end

  namespace :admin do
    resources :posts, :only => [:new, :create, :edit, :update, :destroy, :show] do
      resources :comments, :only => [:destroy]
    end
  end

  root "posts#index"

end
