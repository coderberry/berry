Rails.application.routes.draw do
  sitepress_pages

  get "up" => "rails/health#show", as: :rails_health_check

  sitepress_root
end
