Rails.application.routes.draw do
  resources :blog_posts
  resources :message_of_the_days
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker


  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    # Defines the root path route ("/")
    root "home_page#index"
  end
end
