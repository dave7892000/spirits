Rails.application.routes.draw do
  root 'main#home'

  resources :spirits

end
