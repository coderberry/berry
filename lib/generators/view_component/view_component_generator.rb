# frozen_string_literal: true

require "rails/generators"

class ViewComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  class_option :sitepress, type: :boolean, default: false
  class_option :inline, type: :boolean, default: false
  class_option :skip_preview, type: :boolean, default: false
  class_option :skip_js, type: :boolean, default: false
  class_option :skip_locale, type: :boolean, default: true
  class_option :skip_tailwind, type: :boolean, default: true
  class_option :skip_test, type: :boolean, default: false
  class_option :skip_system_test, type: :boolean, default: true

  argument :attributes, type: :array, default: [], banner: "attribute"

  def create_component_file
    template "component.rb", File.join(root_path, class_path, file_name, "component.rb")
  end

  def create_template_file
    template "component.html.erb",
      File.join(root_path, class_path, file_name, "component.html.erb")
  end

  def create_test_file
    return if options[:skip_test]

    template "component_test.rb",
      File.join(test_root_path, class_path, "#{file_name}_test.rb")
  end

  def create_system_test_file
    return if options[:skip_system_test]

    template "component_system_test.rb",
      File.join(system_test_root_path, class_path, "#{file_name}_test.rb")
  end

  def create_preview_file
    return if options[:skip_preview]

    template "preview.rb",
      File.join(root_path, class_path, file_name, "preview.rb")
  end

  def create_tailwind_file
    return if options[:skip_css]

    template "tailwind.yml",
      File.join(root_path, class_path, file_name, "tailwind.yml")
  end

  def create_js_file
    return if options[:skip_js]

    template "index.js",
      File.join(root_path, class_path, file_name, "index.js")
  end

  def create_locale_file
    return if options[:skip_locale]

    template "en.yml",
      File.join(root_path, class_path, file_name, "en.yml")
  end

  private

  def root_path
    return "app/components/sitepress" if options[:sitepress]

    "app/components"
  end

  def test_root_path
    return "test/components/sitepress" if options[:sitepress]

    "test/components"
  end

  def system_test_root_path
    return "test/system/components/sitepress" if options[:sitepress]

    "test/system/components"
  end

  def parent_class
    "ApplicationViewComponent"
  end

  def preview_parent_class
    "ApplicationViewComponentPreview"
  end

  def initialize_signature
    return sitepress_initialization_signature if options[:sitepress]

    attributes.map { |attr| "#{attr.name}:" }.join(", ")
  end

  def sitepress_initialization_signature
    return "current_page" unless attributes.present?

    attrs = attributes.map { |attr| "#{attr.name}:" }.join(", ")
    ["current_page", attrs].compact.join(", ")
  end

  def attr_readers
    return sitepress_attr_readers if options[:sitepress]

    attributes.map { |attr| ":#{attr.name}" }.join(", ")
  end

  def sitepress_attr_readers
    attributes = [
      OpenStruct.new(name: "page", type: :string),
      OpenStruct.new(name: "data", type: :string),
      *self.attributes
    ]

    attributes.map { |attr| ":#{attr.name}" }.join(", ")
  end

  def initialize_body
    attributes.map { |attr| "@#{attr.name} = #{attr.name}" }.join("\n        ")
  end

  def initialize_call_method_for_inline?
    options[:inline]
  end

  def skip_locale?
    options[:skip_locale]
  end

  def skip_js?
    options[:skip_js]
  end

  def sitepress?
    options[:sitepress]
  end

  def erb_wrapper_class
    "<%= class_for(\"container\") %>"
  end

  def erb_data_controller
    return "" if skip_js?

    " data-controller=\"#{data_controller_identifier}\""
  end

  def erb_body_class
    "<%= class_for(\"body\") %>"
  end

  def erb_locale
    return "Usage" if skip_locale?

    "<%= t(\".usage\") %>"
  end

  def data_controller_identifier
    module_class_name.sub("::Component", "").underscore.split("/").join("--")
  end

  def module_class_name
    if options[:sitepress]
      "Sitepress::#{class_name}"
    else
      class_name
    end
  end
end
