Rails.application.routes.draw do
  devise_for :users
  #crea rutas necesarias
  resources :pics do
    member do
      put "like", to: "pics#upvote"
    end
  end

  # Pagina que funcionara como principal
  root "pics#index"
end
