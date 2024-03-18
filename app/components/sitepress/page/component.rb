# frozen_string_literal: true

module Sitepress
  module Page
    class Component < ApplicationViewComponent
      attr_reader :page, :data

      renders_one :breadcrumbs, "Sitepress::Breadcrumbs::Component"
      renders_one :title, "Title::Component"

      def initialize(page, render_breadcrumbs: true)
        super

        @page = page
        @data = page.data
        @renders_breadcrumbs = render_breadcrumbs
      end

      def render_breadcrumbs?
        @render_breadcrumbs
      end
    end
  end
end
