Rails.application.routes.draw do
  get "/courses", to:'courses#index'
  get "/signup", to:'users#new'
  post "/users", to: 'users#create'
  get "/courses/new", to:'courses#new'
  get "/courses/:id", to:'courses#show'
  get "/login", to:'sessions#new'
  post "/login", to:'sessions#create'
  delete "/logout", to:'sessions#destroy'
  post "/courses", to:'courses#create'
end
