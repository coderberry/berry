Rails.application.configure do
  # See https://lookbook.build/guide/config
  config.lookbook.project_name = "berry.sh"
  config.lookbook.project_logo = false
  config.lookbook.preview_collection_label = "Component Previews"
  config.lookbook.preview_nav_filter = true
  config.lookbook.page_options = {
    footer: false,
    data: {
      brand_colors: {
        red: '#ff0000'
      }
    }
  }
end
