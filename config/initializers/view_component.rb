Rails.application.configure do
  config.view_component.default_preview_layout = "component_preview"
  config.view_component.generate.locale = true
  config.view_component.generate.sidecar = true
  config.view_component.generate.stimulus_controller = true
  config.view_component.preview_paths << Rails.root.join("app", "components")
end

ActiveSupport.on_load(:view_component) do
  # Extend your preview controller to support authentication and other
  # application-specific stuff
  #
  # Rails.application.config.to_prepare do
  #   ViewComponentsController.class_eval do
  #     include Authenticated
  #   end
  # end

  # Make it possible to store previews in sidecar folders
  # See https://github.com/palkan/view_component-contrib#organizing-components-or-sidecar-pattern-extended
  ViewComponent::Preview.extend ViewComponentContrib::Preview::Sidecarable

  # Enable `self.abstract_class = true` to exclude previews from the list
  ViewComponent::Preview.extend ViewComponentContrib::Preview::Abstract
end
