# frozen_string_literal: true

module Sitepress
  module Example
    class Component < Sitepress::Component
      with_collection_parameter :example
      attr_reader :page, :data, :foo

      def initialize(current_page, foo:)
        @page = current_page[:page]
        @data = page.data
          @foo = foo
      end
    end
  end
end
