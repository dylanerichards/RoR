Rails.application.routes.draw do
  resources :responses
  root "pages#home"

  get "/roadmap" => "topics#index"

  get "/introduce-yourself" => "pages#introduction", as: "introduce_yourself"

  post "/newsletter-signup" => "users#newsletter_signup", as: "newsletter_signup"

  resources :topics
  resources :charges
end
