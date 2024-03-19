# frozen_string_literal: true

module Tweet
  class Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    # self.container_class = "w-1/2 border border-gray-300"

    def default
      render Tweet::Component.new(
        author: "Eric Berry",
        handle: "@coderberry",
        link: "https://twitter.com/coderberry/status/1578540742288371714?ref_src=twsrc%5Etfw",
        date_published: "October 8, 2022"
      ) { <<~MARKDOWN }
        The [@RailsSaaS](https://twitter.com/RailsSaaS?ref_src=twsrc%5Etfw] conference was by far the most
        impactful one I've attended. Not only did I learn about amazing tools to speed up development, but I learned
        from some of the most successful leaders in our industry.
      MARKDOWN
    end
  end
end
