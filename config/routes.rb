Rails.application.routes.draw do
  resources :contatos
  get "pages/home", to: "pages#home"
  post "pages/home", to: "pages#home"
  get "pages/informacoes", to: "pages#informacoes"

  # Defines the root path route ("/")
  root "pages#home"
end
