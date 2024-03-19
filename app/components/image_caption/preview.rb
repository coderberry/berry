# frozen_string_literal: true

module ImageCaption
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render ImageCaption::Component.new(markdown: "Eric Berry ([@coderberry](https://x.com/coderberry))")
    end
  end
end
