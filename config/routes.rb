Rails.application.routes.draw do
  root "pages#home"
  get "topics" => "topics#index"
  resources :topics
end
