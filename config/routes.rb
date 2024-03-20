Rails.application.routes.draw do
  sitepress_pages
  sitepress_root

  mount Lookbook::Engine, at: "/lookbook"

  get "/demos/:name/:variant" => "demos#show", as: :demo
  get "/demo_sources" => "demo_sources#show", as: :demo_source

  # legacy link
  get "/posts/rails-saas-conference/" => redirect("/blog/rails-saas-conference")
  get "/posts/rails-saas-conference" => redirect("/blog/rails-saas-conference")

  get "/service-worker.js" => "pwa#service_worker"
  get "/manifest.json" => "pwa#manifest"

  get "up" => "rails/health#show", :as => :rails_health_check
end
