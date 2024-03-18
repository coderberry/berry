class ApplicationViewComponent < ViewComponentContrib::Base
  # Add style variants to your components
  # @see https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants
  include ViewComponentContrib::StyleVariants
  include TailwindHelper
  include PageHelper

  # Sitepress helpers
  delegate :image_tag, :link_to_page, to: :helpers

  def initialize(*)
    tailwind_yaml_path = [
      Rails.root.join("app/components"),
      self.class.name.gsub("::", "/").underscore.gsub("/component", "/tailwind.yml")
    ].join("/")

    @tailwind_defaults ||= begin
      defaults = YAML.safe_load_file(tailwind_yaml_path)
      self.class.instance_variable_set(:@tailwind_defaults, defaults) unless Rails.env.development?
      defaults
    end
  end

  # Auto-creates array of components which is passed to `ViewComponent::Base.with_collection`
  # @param collection [Enumerable] A list of items to pass the ViewComponent one at a time.
  # @param args [Arguments] Arguments to pass to the ViewComponent every time.
  def self.with_sitepress_collection(collection, **args)
    with_collection(Array(collection), **args)
  end

  private

  def identifier
    @identifier ||= self.class.name.sub("::Component", "").underscore.split("/").join("--")
  end

  alias_method :controller_name, :identifier

  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end
end
