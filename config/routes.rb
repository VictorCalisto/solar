Rails.application.routes.draw do
  get "pages/home"
  get "pages/contato"
  get "pages/informacoes"
  # Defines the root path route ("/")
  root "pages#home"
end
