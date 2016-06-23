Rails.application.routes.draw do
  root "pages#home"

  get "/roadmap" => "topics#index"

  resources :topics
end
