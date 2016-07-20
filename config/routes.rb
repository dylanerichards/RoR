Rails.application.routes.draw do
  root "pages#home"

  get "/roadmap" => "topics#index"
  get "/introduce-yourself" => "pages#introduction", as: "introduce_yourself"

  post "/newsletter-signup" => "users#newsletter_signup", as: "newsletter_signup"

  resources :charges
  resources :responses
  resources :topics
end
