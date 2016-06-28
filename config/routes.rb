Rails.application.routes.draw do
  resources :responses
  root "pages#home"

  get "/roadmap" => "topics#index"

  get "/introduction" => "pages#introduction"

  resources :topics
end
