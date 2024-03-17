# frozen_string_literal: true

module ReadingTime
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      Sitepress::ReadingTime::Component.new(content:)
    end
  end
end
