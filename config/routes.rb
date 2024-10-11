Rails.application.routes.draw do
  get "pages/home", to: "pages#home"
  post "pages/home", to: "pages#home"
  get "pages/informacoes"

  # Defines the root path route ("/")
  root "pages#home"
end
