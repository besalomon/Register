Rails.application.routes.draw do
  get "/courses", to:'courses#index'
  get "/signup", to:'users#new'
  post "/users", to: 'users#create'
  get "/courses/:id", to:'courses#show'
end
