Rails.application.routes.draw do
  root 'static_pages#index'

  resources :users,    only: [:new, :create, :show] do
    member do
      get 'activate'
    end
  end
  resource  :session,  only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums,   except: [:index, :new] do
    resources :tracks, only: :new
  end
  resources :tracks,   except: [:index, :new]
  resources :notes,    only: [:create, :destroy, :edit]
end