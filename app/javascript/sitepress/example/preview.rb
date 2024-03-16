# frozen_string_literal: true

module Sitepress
  module Example
    class Preview < Sitepress::ComponentPreview
      # You can specify the container class for the default template
      # self.container_class = "w-1/2 border border-gray-300"

      def default
        Sitepress::Example::Component.new(current_page, foo:)
      end
    end
  end
end
