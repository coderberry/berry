# frozen_string_literal: true

module Markdown
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render(Markdown::Component.new) { <<~MARKDOWN }

        # Hello, Markdown!

        [Eric Berry](https://x.com/coderberry)
      MARKDOWN
    end
  end
end
