Rails.application.routes.draw do

  scope :api do
    resources :logs
    resources :dive_sites
    resources :users, except: [:create]
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
  end
end
