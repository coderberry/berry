class Demo
  include Rails.application.routes.url_helpers

  PREVIEW_TAB_ID = "tab-preview".freeze
  ERB_TAB_ID = "tab-erb".freeze

  attr_reader :name, :variant, :paths

  def initialize(name:, variant:, paths: [], active_tab_id: PREVIEW_TAB_ID)
    @name = name
    @variant = variant
    @paths = paths
    @active_tab_id = active_tab_id
  end

  def tabs
    @tabs ||=
      begin
        demo_tabs = [preview_tab, erb_tab]
        demo_tabs.concat(paths.map { |path| path_tab(path) })
      end
  end

  def active_tab
    tabs.first(&:active?)
  end

  def active_tab?(tab)
    @active_tab_id == tab.tab_id
  end

  private

  def preview_tab
    DemoTab.new(
      name: name,
      variant: variant,
      id: PREVIEW_TAB_ID,
      label: "Preview",
      path: demo_preview_path(name: name, variant: variant),
      active: true
    )
  end

  def erb_tab
    DemoTab.new(
      name: name,
      variant: variant,
      id: ERB_TAB_ID,
      label: "example.html.erb",
      path: demo_source_code_path(path: "app/views/demos/#{name}/_#{variant}.html.erb")
    )
  end

  def path_tab(path)
    DemoTab.new(
      name: name,
      variant: variant,
      id: path_tab_id(path),
      label: File.basename(path),
      path: path
    )
  end

  def path_tab_id(path)
    File.basename(path).parameterize
  end
end
