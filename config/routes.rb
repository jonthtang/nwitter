Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :show], param: :username do
    resources :followings, only:[:create,:destroy]
    resources :notes, except: [:new, :edit] do
      member do
        resources :likes, only:[:create, :destroy]
      end
    end
  end

  get '/home', to: 'notes#home' #current user's dashboard, authenticated area
  root to: 'users#index'

end
