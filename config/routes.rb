Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  root 'posts#index'
end
