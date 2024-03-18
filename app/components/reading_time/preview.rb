# frozen_string_literal: true

module ReadingTime
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      markdown = "word " * 1000
      render ReadingTime::Component.new(markdown)
    end
  end
end
