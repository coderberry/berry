# frozen_string_literal: true

module Sitepress
  module Article
    class Preview < ApplicationViewComponentPreview
      # You can specify the container class for the default template
      # self.container_class = "w-1/2 border border-gray-300"

      def default
        Sitepress::Article::Component.new(current_page)
      end
    end
  end
end
