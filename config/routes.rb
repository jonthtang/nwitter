Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :show, :update], param: :username do
    resources :followings, only:[:create,:destroy]
    resources :notes, except: [:new] do
      member do
        resources :likes, only:[:create, :destroy]
      end
    end
  end

  get '/home', to: 'users#home' #current user's dashboard, authenticated area
  get '/landing', to: 'users#landing'
  root to: 'users#landing'

end
