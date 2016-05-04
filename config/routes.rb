Rails.application.routes.draw do
  root "topics#index"

  resource :topics, only: [:index, :new, :create]
end
