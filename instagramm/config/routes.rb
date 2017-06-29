Rails.application.routes.draw do
  #crea rutas necesarias
  resources :pics

  # Pagina que funcionara como principal
  root "pics#index"
end
