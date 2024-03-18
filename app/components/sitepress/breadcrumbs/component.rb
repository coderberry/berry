# frozen_string_literal: true

module Sitepress
  module Breadcrumbs
    class Component < ApplicationViewComponent
      attr_reader :page, :data

      # @param [PageModel, ArticleModel] page
      def initialize(page)
        super

        @page = page

        @breadcrumbs = [
          {
            text: page.breadcrumb || page.title,
            path: page.request_path
          }
        ]

        page.parents.compact.each do |p|
          breadcrumb_data = {
            text: p.breadcrumb || p.title,
            path: p.request_path
          }

          @breadcrumbs << breadcrumb_data
        end

        @breadcrumbs = @breadcrumbs.reverse
      end
    end
  end
end
