module MetaTags
  extend ActiveSupport::Concern

  included do
    before_action :set_default_meta_tags
  end

  private

  def set_default_meta_tags
    title = "berry.sh"
    description = "The personal website of Eric Berry"

    {
      site: title,
      reverse: true,
      separator: "·",
      description: description,
      canonical: request.original_url,
      noindex: Rails.env.local?,
      keywords: ["coderberry", "stimulus.js", "turbo drive", "turbo streams", "turbo frames", "ruby", "rails"],
      twitter: {
        description: description,
        card: "summary_large_image",
        image: image
      },
      og: {
        description: description,
        type: "website",
        url: request.original_url,
        image: [
          {
            _: image,
            width: 1200,
            height: 630
          }
        ]
      }
    }

    set_meta_tags tag
  end
end
