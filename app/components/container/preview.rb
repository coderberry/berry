# frozen_string_literal: true

module Container
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render Container::Component.new { "<h3>Hello, Container!</h3>" }
    end
  end
end
