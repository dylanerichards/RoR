Rails.application.routes.draw do
  root "topics#index"

  get "pages/home"

  resources :topics
end
