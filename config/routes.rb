Rails.application.routes.draw do
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

    resources :blog_posts
    resources :images
    resources :message_of_the_days
    resources :tags

    # Legend
    get "legend", to: "legend#index", as: "legend_index"
    get "legend/:chapter/:section", to: "legend#show", as: "legend"

    get "services/graphic", to: "services#graphic", as: :services_graphic
    get "services/programming", to: "services#programming", as: :services_programming
  end
end
