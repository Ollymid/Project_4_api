Rails.application.routes.draw do

  get 'oauth/facebook'

  scope :api do
    resources :logs
    resources :dive_sites
    resources :users, except: [:create, :update]
    post 'oauth/facebook'
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
  end
end
