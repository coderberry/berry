Rails.application.routes.draw do
  sitepress_pages
  sitepress_root

  mount Lookbook::Engine, at: "/lookbook"

  # Demo routes (positioning is important)
  get "/demos/:name/:variant/show" => "demos#show", as: :demo
  get "/demos/:name/:variant/tabs/:active_tab_id" => "demos#tabs", as: :demo_tabs
  get "/demos/:name/:variant/preview" => "demos#preview", as: :demo_preview
  get "/demos/source_code" => "demos#source_code", as: :demo_source_code

  # legacy link
  get "/posts/rails-saas-conference/" => redirect("/blog/rails-saas-conference")
  get "/posts/rails-saas-conference" => redirect("/blog/rails-saas-conference")

  get "/service-worker.js" => "pwa#service_worker"
  get "/manifest.json" => "pwa#manifest"

  get "up" => "rails/health#show", :as => :rails_health_check
end
