Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ideas#index'
  get          'sessions/signoutsession'  => 'sessions#destroy', as: :signout
  # delete     '/logout'        =>  'sessions#destroy'

  resources :ideas do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :reviews, only: [:create, :destroy]
  end

  resources :reviews, only: [:edit, :update]

  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
  end


  resources :users, only: [:new, :create, :edit]

  #
  #   resource :users, only: [:edit] do
  #   collection do
  #     patch 'update_password'
  #   end
  # end

end
