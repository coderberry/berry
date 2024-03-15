# frozen_string_literal: true

class Page::ContainerComponent < ViewComponent::Base
  renders_one :breadcrumbs, "UI::BreadcrumbsComponent"
  renders_one :title, "UI::TitleComponent"

  def initialize(page:, render_breadcrumbs: true)
    @page = page
    @render_breadcrumbs = render_breadcrumbs
  end

  def render_breadcrumbs?
    @render_breadcrumbs
  end
end
