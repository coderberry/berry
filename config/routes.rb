Rails.application.routes.draw do
  sitepress_pages
  sitepress_root

  mount Lookbook::Engine, at: "/lookbook"

  # legacy link
  get "/posts/rails-saas-conference/" => redirect("/blog/rails-saas-conference")
  get "/posts/rails-saas-conference" => redirect("/blog/rails-saas-conference")

  get "/service-worker.js" => "pwa#service_worker"
  get "/manifest.json" => "pwa#manifest"

  get "up" => "rails/health#show", :as => :rails_health_check
end
