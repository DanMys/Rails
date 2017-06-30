Rails.application.routes.draw do
  devise_for :users
  #crea rutas necesarias
  resources :pics

  # Pagina que funcionara como principal
  root "pics#index"
end
