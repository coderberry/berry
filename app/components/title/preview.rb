# frozen_string_literal: true

module Title
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render Title::Component.new("Hello, Title!")
    end
  end
end
