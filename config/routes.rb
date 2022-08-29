require "sidekiq/web"
Sidekiq::Web.app_url = "/"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  
  resources :subscribers
  resources :messages

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
