Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'client#index'

  post '/login', to: "sessions#create"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  scope '/graphql' do
    post '/', to: 'graphql#create'
  end

  scope '/api' do
    resources :users
    resources :lists do
      resources :subscribers
      resources :letters
    end
  end
  get "*path", to:"client#index"
end
