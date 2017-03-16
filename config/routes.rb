Rails.application.routes.draw do
  get "/courses", to:'courses#index'
  get "/signup", to:'users#new'
  post "/users", to: 'users#create'
  get "/courses/new", to:'courses#new'
  get "courses/rosters", to:'courses#rosters'
  get "/courses/:id", to:'courses#show'
  post "/courses/:id", to:'courses#registration'
  get "/login", to:'sessions#new'
  post "/login", to:'sessions#create'
  delete "/logout", to:'sessions#destroy'
  post "/courses", to:'courses#create'
  get"/dashboard", to:'users#home'
  get "students", to:'students#index'
  namespace :api do
    namespace :v1 do
      get "/courses", to: 'courses#index'
    end
  end
end
