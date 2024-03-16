# frozen_string_literal: true

module Sitepress
  module Breadcrumbs
    class Component < ApplicationViewComponent
      attr_reader :page, :data

      def initialize(current_page)
        @breadcrumbs = [
          {
            text: current_page[:page].data.fetch("breadcrumb", current_page[:page].data.fetch("title")),
            path: current_page[:page].request_path
          }
        ]

        current_page[:page].parents.compact.each do |page|
          breadcrumb_data = {
            text: page.data.fetch("breadcrumb", page.data.fetch("title")),
            path: page.request_path
          }
          @breadcrumbs << breadcrumb_data
        end

        @breadcrumbs = @breadcrumbs.reverse
      end
    end
  end
end
