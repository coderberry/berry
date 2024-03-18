# frozen_string_literal: true

module Image
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render Image::Component.new(
        path: "avatar.jpg",
        alt: "Eric Berry"
      )
    end
  end
end
