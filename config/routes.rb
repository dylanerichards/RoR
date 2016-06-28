Rails.application.routes.draw do
  root "pages#home"

  get "/roadmap" => "topics#index"

  get "/introduction" => "pages#introduction"

  resources :topics
end
