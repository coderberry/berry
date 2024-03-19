# frozen_string_literal: true

module Sitepress
  module Page
    class Component < ApplicationViewComponent
      attr_reader :page

      renders_one :title, "Title::Component"
      renders_one :breadcrumbs, "Sitepress::Breadcrumbs::Component"

      # @param [PageModel] page
      def initialize(page, render_title: true, render_breadcrumbs: true, **)
        super

        @page = page
        @render_title = render_title
        @render_breadcrumbs = render_breadcrumbs
      end

      def render_title?
        @render_title
      end

      def render_breadcrumbs?
        @render_breadcrumbs
      end
    end
  end
end
