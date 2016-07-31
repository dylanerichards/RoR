Rails.application.routes.draw do
  root "pages#home"

  get "/roadmap" => "topics#index"
  get "/introduce-yourself" => "pages#introduction", as: "introduce_yourself"

  get "/emails" => "users#emails", as: "emails"

  post "/newsletter-signup" => "users#newsletter_signup", as: "newsletter_signup"

  resources :charges
  resources :responses, except: [:index, :show]
  resources :topics
end
