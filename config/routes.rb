# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :suns, only: [:index, :show]
      resources :compatibilities
      resources :users
      get 'users/:id/sun_compats', to: 'users#sun_compats'
      resources :matches
    end
  end
end
