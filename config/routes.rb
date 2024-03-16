Rails.application.routes.draw do
  sitepress_pages
  sitepress_root

  mount Lookbook::Engine, at: "/lookbook"

  get "/service-worker.js" => "pwa#service_worker"
  get "/manifest.json" => "pwa#manifest"

  get "up" => "rails/health#show", :as => :rails_health_check
end
