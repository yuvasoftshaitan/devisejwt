Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
   resources :users
   post '/auth/login', to: 'authentication#login' 


end
