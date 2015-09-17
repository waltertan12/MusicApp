Rails.application.routes.draw do
  get 'tracks/new'

  get 'tracks/edit'

  get 'tracks/show'

  get 'albums/new'

  get 'albums/edit'

  get 'albums/show'

  get 'bands/new'

  get 'bands/edit'

  get 'bands/show'

  root 'users#new'

  resources :users,   only: [:new, :create, :show]
  resource  :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: :new
  end
  resources :albums,  except: [:index, :new] do
    resources :tracks, only: :new
  end
  resources :tracks,  except: [:index, :new]
end
