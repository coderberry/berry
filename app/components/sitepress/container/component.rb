# frozen_string_literal: true

module Sitepress
  module Container
    class Component < ApplicationViewComponent
      attr_reader :page

      # @param [PageModel] article
      def initialize(page, render_breadcrumbs: true)
        super

        @page = page
        @render_breadcrumbs = render_breadcrumbs
      end

      def render_breadcrumbs?
        @render_breadcrumbs
      end
    end
  end
end
