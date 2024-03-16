class ApplicationViewComponent < ViewComponentContrib::Base
  # Add style variants to your components
  # @see https://github.com/palkan/view_component-contrib?tab=readme-ov-file#style-variants
  include ViewComponentContrib::StyleVariants

  private

  def identifier
    @identifier ||= self.class.name.sub("::Component", "").underscore.split("/").join("--")
  end

  alias_method :controller_name, :identifier

  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end
end
